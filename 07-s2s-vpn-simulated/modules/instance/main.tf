resource "aws_instance" "this" {
  ami                         = var.ami_image_id
  instance_type               = var.instance_type
  associate_public_ip_address = var.allocate_public_ip
  security_groups             = var.security_group_ids
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  user_data                   = var.user_data
  user_data_replace_on_change = true
  source_dest_check           = var.source_dest_check_enabled

  lifecycle {
    ignore_changes = [ami, associate_public_ip_address, security_groups]
  }

  tags = {
    Name = "${var.instance_name}"
  }

}
