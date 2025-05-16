# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Provider's Variables
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

variable "region" {
  description = "Our AWS Region"
}

variable "access_key" {
  description = "Our access key"
}

variable "secret_key" {
  description = "Our secret key"
}

# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Project's Variables
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

variable "project_name" {
  type = string
}

variable "az_preferrence" {
  type = string
}

variable "cidr_vpc_aws" {
  type = string
}

variable "cidr_vpc_on_prem" {
  type = string
}

variable "instance_type" {
  type        = string
  default     = "t2.micro" # Free Tier
  description = "Your Instance type"
}

variable "key_name" {
  type        = string
  description = "Your SSH Key Name"
}
