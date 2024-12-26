
# -------------------------------------------------------------- VPC variables --------------------------------------------------------------------- #
variable "project_name" {
  type = string
}

variable "netw_cidr" {
  type        = string
  description = "VPC Network CIDR Range"
}

variable "vpc_azs" {
  type        = list(string)
  description = "Availability Zones in Our Region"
}

# ---------------------------- Public Subnets ---------------------------------------------------------------------------------------------------
variable "subnet_public_cidrs" {
  type        = list(string)
  description = "Public Subnets CIDR Range"
}

# ---------------------------- Private Subnets ---------------------------------------------------------------------------------------------------
variable "subnet_private_cidrs" {
  type        = list(string)
  description = "Private Subnets CIDR Range"
}

# ---------------------------- Private Database Subnets ---------------------------------------------------------------------------------------------------
variable "subnet_db_cidrs" {
  type        = list(string)
  description = "Private Database Subnets CIDR Range"
}
# -------------------------------------------------------------------------------------------------------------------------------------------------- #
