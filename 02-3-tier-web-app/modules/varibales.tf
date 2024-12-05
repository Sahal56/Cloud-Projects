# -----------------------------------------------------------------------
# ---------------------------- VPC variables ----------------------------

variable "netw_cidr" {
  description = "VPC Network CIDR Range"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones in Our Region"
}

# ---------------------------- Public Subnets ----------------------------
variable "subnet_public_cidrs" {
  type        = list(string)
  description = "Public Subnets CIDR Range"
}

# ---------------------------- Private Subnets ----------------------------
variable "subnet_private_cidrs" {
  type        = list(string)
  description = "Private Subnets CIDR Range"
}

# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
