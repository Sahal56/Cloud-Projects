variable "ami_image_id" {
  type        = string
  description = "The ID of the AMI (Amazon Machine Image) to use for the instance."
}

variable "instance_type" {
  type        = string
  description = "The type of EC2 instance to launch (e.g., t2.micro, m5.large)."
}

variable "allocate_public_ip" {
  type        = bool
  default     = false # Default to not allocating a public IP
  description = "A boolean value indicating whether to allocate a public IP address to the instance."
}

variable "security_group_ids" {
  type        = list(string)
  description = "A list of security group IDs to associate with the instance."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet in which to launch the instance."
}

variable "key_name" {
  type        = string
  description = "The name of the EC2 key pair to associate with the instance for SSH access."
}

variable "user_data" {
  type        = string
  default     = ""
  description = "User data to provide when launching the instance. This can be a script or configuration."
}

variable "source_dest_check_enabled" {
  type        = bool
  default     = true
  description = "Whether source/destination checking is enabled on the instance's network interface."
}

variable "instance_name" {
  type        = string
  default     = "ec2-instance"
  description = "Instance Name of our EC2"
}
