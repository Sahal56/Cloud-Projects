output "vpc_id" {
  value = aws_vpc.this.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.this.id
}

output "cidr_block" {
  value = aws_vpc.this.cidr_block
}

output "public_route_table_id" {
  value = aws_route_table.this_public.id
}

output "private_route_table_id" {
  value = aws_route_table.this_private.id
}

output "default_security_group_id" {
  value = aws_vpc.this.default_security_group_id
}

output "public_subnet_id" {
  value = aws_subnet.this_public.id
}
output "private_subnet_id" {
  value = aws_subnet.this_private.id
}
