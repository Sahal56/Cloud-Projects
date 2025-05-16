# Note: Provision in the following order (it works together, but may require waiting or rebooting the Libreswan instance)
# 1. Infrastructure : VPC
# 2. S2S VPN. Customer GW, VPN GW
# 3. EC2 Instances

# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Part 1: VPCs
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module "vpc_on_prem" {
  source             = "./modules/vpc"
  cidr_block         = var.cidr_vpc_on_prem
  peer_cidr_block    = var.cidr_vpc_aws
  home_cidr_block    = "${data.http.home_ip.response_body}/32"
  az_preferrence     = var.az_preferrence
  vpc_name           = "on-prem"
  project_name       = var.project_name
  ec2_connect_prefix = data.aws_ec2_managed_prefix_list.ec2_connect.id
}

module "vpc_aws" {
  source             = "./modules/vpc"
  cidr_block         = var.cidr_vpc_aws
  peer_cidr_block    = var.cidr_vpc_on_prem
  home_cidr_block    = "${data.http.home_ip.response_body}/32"
  az_preferrence     = var.az_preferrence
  vpc_name           = "aws"
  project_name       = var.project_name
  ec2_connect_prefix = data.aws_ec2_managed_prefix_list.ec2_connect.id

  # Uncomment After Part 2
  vpn_tunnel1_address = aws_vpn_connection.this.tunnel1_address
  vpn_tunnel2_address = aws_vpn_connection.this.tunnel2_address

}

# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Part 2: VPN Connection
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Elastic IP
resource "aws_eip" "libreswan_eip" {
  depends_on = [module.vpc_on_prem.internet_gateway_id]
  domain     = "vpc"
}

# Private ASN starts from 64512 to 65534
resource "aws_customer_gateway" "this" {
  bgp_asn     = 65016
  type        = "ipsec.1" # AWS only supports ipsec.1 as of now 13 May 2025
  ip_address  = aws_eip.libreswan_eip.public_ip
  device_name = "Libreswan"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.project_name} customer-gateway"
  }
}

resource "aws_vpn_gateway" "this" {
  availability_zone = var.az_preferrence

  tags = {
    Name = "${var.project_name} virtual-private-gateway"
  }
}

resource "aws_vpn_gateway_attachment" "this" {
  vpc_id         = module.vpc_aws.vpc_id
  vpn_gateway_id = aws_vpn_gateway.this.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection
# PS : It took 3min 15 in Mumbai
resource "aws_vpn_connection" "this" {
  type                = aws_customer_gateway.this.type # ipsec.1 | check above
  customer_gateway_id = aws_customer_gateway.this.id
  vpn_gateway_id      = aws_vpn_gateway.this.id

  static_routes_only = true # easy way
  # static_routes_only = false # For dynamic routing (BGP)

  local_ipv4_network_cidr  = module.vpc_on_prem.cidr_block
  remote_ipv4_network_cidr = module.vpc_aws.cidr_block
}

# Add Static IP Prefix of On Prem to S2S VPN
resource "aws_vpn_connection_route" "this_on_prem" {
  depends_on             = [aws_vpn_connection.this]
  destination_cidr_block = module.vpc_on_prem.cidr_block
  vpn_connection_id      = aws_vpn_connection.this.id
}

# Enable Route Propagation
# - Static Routes are propagated from VPN GW to respective Route Tables.
# - Here we are enabling on both Public & Private RT of AWS VPC
# - It will propagated only when Tunnel is UP
resource "aws_vpn_gateway_route_propagation" "this_private" {
  vpn_gateway_id = aws_vpn_gateway.this.id
  route_table_id = module.vpc_aws.private_route_table_id
}
resource "aws_vpn_gateway_route_propagation" "this_public" {
  vpn_gateway_id = aws_vpn_gateway.this.id
  route_table_id = module.vpc_aws.public_route_table_id
}

# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Part 3: Instances
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module "libreswan_instance" {
  source        = "./modules/instance"
  instance_name = "libreswan_on_prem_instance"
  # Modify Cloud Init as needed based on OS and Libreswan version availability.
  # 1 tunnel : user-data-libreswan.yaml, 2 Tunnels : user-data-libreswan-al2023-x64.yaml
  ami_image_id              = data.aws_ami.amazon_linux_2023_x86_64.image_id # Check utilities.tf/cloud-init & scripts/*.yaml
  instance_type             = var.instance_type
  security_group_ids        = [module.vpc_on_prem.default_security_group_id]
  subnet_id                 = module.vpc_on_prem.public_subnet_id
  key_name                  = var.key_name
  user_data                 = data.cloudinit_config.libreswan_cloudinit_config.rendered
  source_dest_check_enabled = false
}

resource "aws_eip_association" "this" {
  depends_on    = [aws_eip.libreswan_eip, module.libreswan_instance]
  instance_id   = module.libreswan_instance.instance_id
  allocation_id = aws_eip.libreswan_eip.id
}

resource "aws_route" "on_prem_to_libreswan" {
  depends_on = [module.libreswan_instance, module.vpc_on_prem]
  # Route Traffic from On Prem Resources to Libreswan Instance

  route_table_id         = module.vpc_on_prem.public_route_table_id
  destination_cidr_block = var.cidr_vpc_aws
  network_interface_id   = module.libreswan_instance.primary_eni_id
}

# Other on prem Instance | If you need
# module "on_prem_instance" {
#   source             = "./modules/instance"
#   instance_name      = "on_prem_instance"
#   ami_image_id       = data.aws_ami.amazon_linux_2023_x86_64.image_id
#   instance_type      = var.instance_type
#   allocate_public_ip = true
#   security_group_ids = [module.vpc_on_prem.default_security_group_id]
#   subnet_id          = module.vpc_on_prem.public_subnet_id
#   key_name           = var.key_name
# }

module "aws_instance" {
  source             = "./modules/instance"
  instance_name      = "aws_instance"
  ami_image_id       = data.aws_ami.amazon_linux_2023_x86_64.image_id
  instance_type      = var.instance_type
  allocate_public_ip = true
  security_group_ids = [module.vpc_aws.default_security_group_id]
  subnet_id          = module.vpc_aws.public_subnet_id
  key_name           = var.key_name
  user_data          = data.cloudinit_config.aws_cloud.rendered
}
