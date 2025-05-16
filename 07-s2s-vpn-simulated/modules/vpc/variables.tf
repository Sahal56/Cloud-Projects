/* Names */
variable "project_name" {
  type = string
}

variable "vpc_name" {
  type = string
}


variable "cidr_block" {
  type = string
}

variable "peer_cidr_block" {
  type = string
}

variable "home_cidr_block" {
  type = string
}

variable "ec2_connect_prefix" {
  type    = string
  default = null
}


/* VPN Details */
variable "vpn_tunnel1_address" {
  type    = string
  default = null
}

variable "vpn_tunnel2_address" {
  type    = string
  default = null
}

/* AZ */
variable "az_preferrence" {
  type = string
}

