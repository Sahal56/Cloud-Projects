output "rt_public_id" {
  value = aws_route_table.rt_public.id
}

output "rt_private_id" {
  value = aws_route_table.rt_private.id
}

output "rt_database_id" {
  value = aws_route_table.rt_database.id
}
