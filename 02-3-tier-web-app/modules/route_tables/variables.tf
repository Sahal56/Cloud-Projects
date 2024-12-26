variable "project_name" {
  type = string
}

variable "netw_cidr" {
  type        = string
  description = "VPC Network CIDR Range"
}
variable "vpc_id" {
  type = string
}

variable "ig_id" {
  type = string
}

variable "subnets_public_ids" {
  type = list(string)
}
variable "subnets_private_ids" {
  type = list(string)
}
variable "subnets_database_ids" {
  type = list(string)
}
