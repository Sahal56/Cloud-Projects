resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags = {
    Name = "${var.project_name} ${var.vpc_name}-vpc"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.project_name} ${var.vpc_name}-internet-gateway"
  }
}

resource "aws_default_security_group" "this" {
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = [var.cidr_block, var.peer_cidr_block, var.home_cidr_block]
    description = "Allow all traffic from On Prem, AWS & Home IP Range"
  }

  dynamic "ingress" {
    for_each = var.ec2_connect_prefix == null ? [] : [1]
    content {
      from_port       = 22
      to_port         = 22
      protocol        = "tcp"
      prefix_list_ids = [var.ec2_connect_prefix]
      description     = "Allow SSH from EC2 Instance Connect"
    }
  }

  dynamic "ingress" {
    for_each = var.vpn_tunnel1_address == null ? [] : [1]
    content {
      from_port   = 500
      to_port     = 500
      protocol    = "udp"
      cidr_blocks = ["${var.vpn_tunnel1_address}/32", "${var.vpn_tunnel2_address}/32"]
    }
  }

  dynamic "ingress" {
    for_each = var.vpn_tunnel1_address == null ? [] : [1]
    content {
      from_port   = 4500
      to_port     = 4500
      protocol    = "udp"
      cidr_blocks = ["${var.vpn_tunnel1_address}/32", "${var.vpn_tunnel2_address}/32"]
    }
  }

  egress {
    protocol    = "all"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name} ${var.vpc_name}-sg"
  }
}

# For Testing Purpose, NACL will allow everything inbound and outbound
resource "aws_default_network_acl" "this" {
  default_network_acl_id = aws_vpc.this.default_network_acl_id

  # Inbound Rules
  ingress {
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = "0.0.0.0/0"
  }

  # Outbound Rules
  egress {
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    from_port  = 0
    to_port    = 0
    cidr_block = "0.0.0.0/0"
  }

  lifecycle {
    ignore_changes = [subnet_ids]
  }

  tags = {
    Name = "${var.project_name} ${var.vpc_name}-nacl"
  }
}

# Public Subnet & Route Table
resource "aws_subnet" "this_public" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone = var.az_preferrence

  # Disbaled | We will explicit assign at time of Launching
  # map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name} ${var.vpc_name}-public-subnet"
  }
}

resource "aws_network_acl_association" "this_public" {
  network_acl_id = aws_default_network_acl.this.id
  subnet_id      = aws_subnet.this_public.id
}

resource "aws_route_table" "this_public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  lifecycle {
    ignore_changes = [propagating_vgws, route]
  }

  tags = {
    Name = "${var.project_name} ${var.vpc_name}-public-route-table"
  }
}

resource "aws_route_table_association" "this_public" {
  subnet_id      = aws_subnet.this_public.id
  route_table_id = aws_route_table.this_public.id
}

# Private Subnet & Route Table
resource "aws_subnet" "this_private" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = var.az_preferrence
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project_name} ${var.vpc_name}-private-subnet"
  }
}

resource "aws_network_acl_association" "this_private" {
  network_acl_id = aws_default_network_acl.this.id
  subnet_id      = aws_subnet.this_private.id
}

resource "aws_route_table" "this_private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.cidr_block
    gateway_id = "local"
  }

  lifecycle {
    ignore_changes = [propagating_vgws, route]
  }

  tags = {
    Name = "${var.project_name} ${var.vpc_name}-private-route-table"
  }
}

resource "aws_route_table_association" "this_private" {
  subnet_id      = aws_subnet.this_private.id
  route_table_id = aws_route_table.this_private.id
}
