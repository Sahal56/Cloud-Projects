# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Outputs
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

output "libreswan_elastic_ip" {
  value = aws_eip.libreswan_eip.public_ip
}

output "libreswan_instance_private_ip" {
  value = module.libreswan_instance.private_ip
}

output "vpc_aws_instance_private_ip" {
  value = module.aws_instance.private_ip
}

# output "on_prem_instance_instance_private_ip" {
#   value = module.on_prem_instance.private_ip
# }

# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# For Testing/Confirming
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
output "home_ip" {
  value       = "${data.http.home_ip.response_body}/32"
  description = "This IP is of Home Network. It will probably given by ISP or of ISP"
  # Ensure it is ipv4
}

# output "al2023_arm_image_id" {
#   value = data.aws_ami.amazon_linux_2023_arm.image_id
# }
# output "al2023_x86_64_image_id" {
#   value = data.aws_ami.amazon_linux_2023_x86_64.image_id
# }

