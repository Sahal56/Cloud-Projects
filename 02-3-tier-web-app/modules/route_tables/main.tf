# Source : https://www.packetswitch.co.uk/terraform-how-to-associate-multiple-subnets-to-route-table/

# when vpc is created, some things are automatically created:
#     - one main RT
#     - one route with dest as our VPC CIDR block and target as local

# New Route Tables | Total : 3
# - Public RT & Public Subnets Association
# - Private RT & Private Subnets Association
# - Database RT & Database Subnets Association

# Route Table for Public Subnets
resource "aws_route_table" "rt_public" {
  depends_on = [var.vpc_id]
  vpc_id     = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.ig_id
  }

  tags = {
    Name = "${var.project_name} rt-public-subnet"
  }

}
# Route Table Association for Public Subnets
resource "aws_route_table_association" "rt_association_public" {
  depends_on     = [aws_route_table.rt_public, var.subnets_public_ids]
  route_table_id = aws_route_table.rt_public.id

  # Use for_each to iterate
  for_each  = toset(var.subnets_public_ids)
  subnet_id = each.value
}


# Route Table for Private Subnets
resource "aws_route_table" "rt_private" {
  depends_on = [var.vpc_id]
  vpc_id     = var.vpc_id

  route {
    cidr_block = var.netw_cidr
    gateway_id = "local"
  }

  tags = {
    Name = "${var.project_name} rt-private-subnet"
  }
}

# # -- for NAT if exists
# resource "aws_route" "rt_nat" {
#   route_table_id         = aws_route_table.rt_private.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = "your-nat-gw-id"
# }

# Route Table Association for Private Subnets
resource "aws_route_table_association" "rt_association_private" {
  depends_on     = [aws_route_table.rt_private, var.subnets_private_ids]
  route_table_id = aws_route_table.rt_private.id
  for_each       = toset(var.subnets_private_ids)
  subnet_id      = each.value
}

# Route Table for Database Subnets
resource "aws_route_table" "rt_database" {
  depends_on = [var.vpc_id]
  vpc_id     = var.vpc_id

  route {
    cidr_block = var.netw_cidr
    gateway_id = "local"
  }

  tags = {
    Name = "${var.project_name} rt-database-subnet"
  }
}
# Route Table Association for Database Subnets
resource "aws_route_table_association" "rt_association_database" {
  depends_on     = [aws_route_table.rt_database, var.subnets_database_ids]
  route_table_id = aws_route_table.rt_database.id
  for_each       = toset(var.subnets_database_ids)
  subnet_id      = each.value

}
