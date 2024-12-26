# Security Groups | Total : 7
# - 2 : ALB & Web Tier
# - 2 : Internal ALB & App Tier
# - 1 : Database Tier
# - 2 : AMI | EC2 and EC2 Instance Endpoint

resource "aws_security_group" "sg_alb" {
  depends_on  = [var.vpc_id]
  vpc_id      = var.vpc_id
  name        = "${var.project_name} sg-alb"
  description = "Security Group for Application Load Balancer"

  # Inbound Rules
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "HTTP access from anywhere"
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "HTTPS access from anywhere"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.project_name} sg-alb"
  }
}

resource "aws_security_group" "sg_web_tier" {
  depends_on  = [var.vpc_id, aws_security_group.sg_alb]
  vpc_id      = var.vpc_id
  name        = "${var.project_name} sg-web-tier"
  description = "Security Group for Web Tier Instances"

  # Inbound Rules
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_alb.id]
    description     = "Allow HTTP traffic from the ALB Security group"
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_alb.id]
    description     = "Allow HTTPS traffic from the ALB Security group"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.project_name} sg-web-tier"
  }
}

resource "aws_security_group" "sg_internal_alb" {
  depends_on  = [var.vpc_id, aws_security_group.sg_web_tier]
  vpc_id      = var.vpc_id
  name        = "${var.project_name} sg-internal-alb"
  description = "Security Group for Internal Application Load Balancer"

  # Inbound Rules | only HTTP
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_web_tier.id]
    description     = "HTTP access from Web Tier Security Group"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.project_name} sg-internal-alb"
  }
}

resource "aws_security_group" "sg_app_tier" {
  depends_on  = [var.vpc_id, aws_security_group.sg_internal_alb]
  vpc_id      = var.vpc_id
  name        = "${var.project_name} sg-app-tier"
  description = "Security Group for App Tier Instances"

  # Inbound Rules | PORT : 4000
  ingress {
    from_port       = 4000
    to_port         = 4000
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_internal_alb.id]
    description     = "Allow HTTP traffic from the Internal ALB Security Group"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.project_name} sg-app-tier"
  }
}

# Security Group for Aurora
resource "aws_security_group" "sg_db_tier" {
  depends_on  = [var.vpc_id, aws_security_group.sg_app_tier]
  vpc_id      = var.vpc_id
  name        = "${var.project_name} sg-db-tier"
  description = "Security Group for Database Tier Instances or Database"

  # Inbound Rules | PORT : 3306
  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    security_groups = [
      aws_security_group.sg_app_tier.id,
      aws_security_group.sg_ec2_instance.id
    ]
    description = "Allow MySQL/Aurora traffic from the Security Group of App Tier & EC2 Instance"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.project_name} sg-db-tier"
  }
}

# -------------------------------- Security Groups for Creating AMI : EC2 Instance & EC2 Instance Connect Endpoint -------------------------------- #
# Note:
# 1. First of all create both security groups without ingress and outgress rules | as they depend on each other | will give Cycle error by Terraform
# 2. Then add VPC Security group ingress & egress resources (inbound - outbound rules | referrencing each other)

resource "aws_security_group" "sg_ec2_instance" {
  depends_on  = [var.vpc_id]
  vpc_id      = var.vpc_id
  name        = "${var.project_name} sg-ec2-instance"
  description = "Security Group for EC2 Instance for creating AMI"

  # Inbound Rules
  # Go to vpc ingress rule

  # Outbound Rules
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.project_name} sg-ec2-instance"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_app_ec2_instance_ingress_rule" {
  depends_on        = [aws_security_group.sg_ec2_instance]
  security_group_id = aws_security_group.sg_ec2_instance.id
  description       = "Allows inbound SSH traffic from the resources associated with the endpoint security group sg-ec2-connect-endpoint"

  # destination security group
  referenced_security_group_id = aws_security_group.sg_ec2_connect_endpoint.id
  from_port                    = 22
  to_port                      = 22
  ip_protocol                  = "tcp"

}

resource "aws_security_group" "sg_ec2_connect_endpoint" {
  depends_on  = [var.vpc_id]
  vpc_id      = var.vpc_id
  name        = "${var.project_name} sg-ec2-connect-endpoint"
  description = "Security Group for EC2 Instance Connect Endpoint for creating AMI"

  # Inbound Rules | Not Required
  # ingress {
  #   from_port        = 80
  #   to_port          = 80
  #   protocol         = "tcp"
  #   cidr_blocks      = ["0.0.0.0/0"]
  #   ipv6_cidr_blocks = ["::/0"]
  #   description      = "HTTP access from anywhere"
  # }

  # Outbound Rules
  # Go to vpc egress rule
  # this is to avoid loop

  tags = {
    Name = "${var.project_name} sg-ec2-connect-endpoint"
  }
}

resource "aws_vpc_security_group_egress_rule" "sg_ec2_connect_endpoint_egress_rule" {
  depends_on        = [aws_security_group.sg_ec2_connect_endpoint]
  security_group_id = aws_security_group.sg_ec2_connect_endpoint.id

  # destination security group
  referenced_security_group_id = aws_security_group.sg_ec2_instance.id
  from_port                    = 22
  to_port                      = 22
  ip_protocol                  = "tcp"

}
