output "public_ip" {
  value = aws_instance.this.public_ip
}
output "private_ip" {
  value = aws_instance.this.private_ip
}

output "instance_id" {
  value       = aws_instance.this.id
  description = "The ID of the EC2 instance"
}

output "primary_eni_id" {
  value       = aws_instance.this.primary_network_interface_id
  description = "The ID of the primary network interface"
}
