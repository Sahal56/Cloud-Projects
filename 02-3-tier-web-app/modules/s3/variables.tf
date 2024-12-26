variable "project_name" {
  type = string
}

variable "user_arn" {
  type = string
}

variable "ec2_role_arn" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "s3_bucket_name" {
  type = string
}

variable "region" {
  description = "Our AWS Region"
}

variable "rt_public_id" {
  description = "Route Table ID for Public Subnet"
}

variable "rt_private_id" {
  description = "Route Table ID for Private Subnet"
}

