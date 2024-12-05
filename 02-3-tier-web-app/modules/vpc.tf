#  source : https://spacelift.io/blog/terraform-aws-vpc

resource "aws_vpc" "my_vpc" {
  cidr_block = var.netw_cidr

  tags = {
    Name = "Project 3 Tier Web App VPC"
  }
}

resource "aws_subnet" "public_subnets" {
  count      = length(var.subnet_public_cidrs)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = element(var.subnet_public_cidrs, count.index)
  # our AZ are same as subnets i.e. 3
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Public Subnets ${count.index + 1}"
  }
}

resource "aws_subnet" "public_subnets" {
  count      = length(var.subnet_private_cidrs)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = element(var.subnet_private_cidrs, count.index)
  # our AZ are same as subnets i.e. 3
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Private Subnets ${count.index + 1}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Project 3 Tier Web App IGW"
  }

}


