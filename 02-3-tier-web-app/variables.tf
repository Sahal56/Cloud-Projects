# -------------------------------------------------------------- Credentials variables ------------------------------------------------------------- #
variable "region" {
  description = "Our AWS Region"
}

variable "access_key" {
  description = "Our access key"
}

variable "secret_key" {
  description = "Our secret key"
}

variable "project_name" {
  type = string
}

variable "user_name" {
  type = string
}

# -------------------------------------------------------------- VPC variables --------------------------------------------------------------------- #
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


# # ------------------------------------------------------------- S3 variables ----------------------------------------------------------------------- #
variable "s3_bucket_name" {
  description = "Our S3 Bucket Name"
  type        = string
}
# # -------------------------------------------------------------------------------------------------------------------------------------------------- #


