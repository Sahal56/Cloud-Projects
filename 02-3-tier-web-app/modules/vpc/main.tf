#  source : https://spacelift.io/blog/terraform-aws-vpc

resource "aws_vpc" "my_vpc" {
  cidr_block           = var.netw_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name} vpc"
  }
}

# Total Subnets : 9

resource "aws_subnet" "subnets_public" {
  depends_on = [aws_vpc.my_vpc]
  vpc_id     = aws_vpc.my_vpc.id

  count      = length(var.subnet_public_cidrs)
  cidr_block = element(var.subnet_public_cidrs, count.index)
  # our AZ are same as subnets i.e. 3
  availability_zone = element(var.vpc_azs, count.index)

  tags = {
    Name = "${var.project_name} public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "subnets_private" {
  depends_on = [aws_vpc.my_vpc]
  vpc_id     = aws_vpc.my_vpc.id

  count      = length(var.subnet_private_cidrs)
  cidr_block = element(var.subnet_private_cidrs, count.index)
  # our AZ are same as subnets i.e. 3
  availability_zone = element(var.vpc_azs, count.index)

  tags = {
    Name = "${var.project_name} private-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "subnets_database" {
  depends_on = [aws_vpc.my_vpc]
  count      = length(var.subnet_db_cidrs)

  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = element(var.subnet_db_cidrs, count.index)
  # our AZ are same as subnets i.e. 3
  availability_zone = element(var.vpc_azs, count.index)
  tags = {
    Name = "${var.project_name} database-subnet-${count.index + 1}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  depends_on = [aws_vpc.my_vpc]
  vpc_id     = aws_vpc.my_vpc.id

  tags = {
    Name = "${var.project_name} ig"
  }

}
