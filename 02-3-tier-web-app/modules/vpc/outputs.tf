output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "ig_id" {
  value = aws_internet_gateway.igw.id
}

output "subnets_public_ids" {
  description = "List of Public Subnet IDs"
  value       = [for subnet in aws_subnet.subnets_public : subnet.id]
}

output "subnets_private_ids" {
  description = "List of Private Subnet IDs"
  value       = [for subnet in aws_subnet.subnets_private : subnet.id]
}

output "subnets_database_ids" {
  description = "List of Database Subnet IDs"
  value       = [for subnet in aws_subnet.subnets_database : subnet.id]
}
