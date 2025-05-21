# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Utilities | For supporting main terraform files
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Fetch Home IP
#   - Avoid when travelling around offices, bus, home. Explicitly supply in variables if you want consistent setup
#   - Ensure it is ipv4
data "http" "home_ip" {
  url = "https://checkip.amazonaws.com/"
  # Available options : https://checkip.amazonaws.com/ | https://ifconfig.me/ip
}

# Fetch EC2 Instance Connect Prefix ID
data "aws_ec2_managed_prefix_list" "ec2_connect" {
  name = "com.amazonaws.${var.region}.ec2-instance-connect"
}

# Fetch AMI ID for Amazon Linux 2023 ARM
data "aws_ami" "amazon_linux_2023_arm" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "architecture"
    values = ["arm64"]
  }
}

# Fetch AMI ID for Amazon Linux 2023 X64
data "aws_ami" "amazon_linux_2023_x86_64" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Cloud init for EC2 Instances | https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config

# Libreswan Official Guide
#   - https://libreswan.org/man/ipsec.conf.5.html
#   - https://libreswan.org/man/ipsec.secrets.5.html
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

data "cloudinit_config" "libreswan_cloudinit_config" {
  gzip          = false
  base64_encode = false

  part {
    content = templatefile(
      "./scripts/user-data-libreswan-al2023-x64.yaml",
      {
        libreswan_ip : aws_eip.libreswan_eip.public_ip,
        vpn_ip_1 : aws_vpn_connection.this.tunnel1_address,
        vpn_ip_2 : aws_vpn_connection.this.tunnel2_address,
        on_prem_cidr_block : module.vpc_on_prem.cidr_block,
        aws_cidr_block : module.vpc_aws.cidr_block,
        psk_1 : aws_vpn_connection.this.tunnel1_preshared_key,
        psk_2 : aws_vpn_connection.this.tunnel2_preshared_key,
      }
    )
    content_type = "text/jinja2"
    filename     = "cloud-init.conf"
  }
}

data "cloudinit_config" "aws_cloud" {
  gzip          = false
  base64_encode = false

  part {
    content      = file("./scripts/user-data-aws-instance.yaml")
    content_type = "text/cloud-config"
    filename     = "cloud-init.conf"
  }
}

