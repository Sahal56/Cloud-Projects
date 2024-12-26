# -------------------------------------------------------------------- EC2(App Tier) variables -------------------------------------------------------------------- #
variable "app_ami_id" {
  type        = string
  description = "EC2 AMI id for app Tier"
}

variable "app_ec2_type" {
  type        = string
  description = "Instance type for app Tier"
  default     = "t2.micro"
}

variable "app_dev_name" {
  type        = string
  description = "Device name for the volume of EC2 instances running in the app Tier"
  default     = "/dev/xvda"
}

variable "app_ebs_vol_size" {
  type        = string
  description = "Size of EBS Storage Volume"
  default     = "8"
}

variable "app_ebs_vol_type" {
  type        = string
  description = "Type of EBS Storage Volume"
  default     = "gp3"
}

variable "app_asg_min" {
  type        = number
  description = "Minimum number of instances in the ASG in the app Tier"
  default     = 1
}

variable "app_asg_desired" {
  type        = number
  description = "Desired number of instances in the ASG in the app Tier"
  default     = 1
}

variable "app_asg_max" {
  type        = number
  description = "Maximum number of instances in the ASG in the app Tier"
  default     = 3
}

variable "app_asg_health_check_type" {
  type        = string
  description = "Health Check type EC2 or ELB"
  default     = "ELB"
}

variable "app_max_threshold" {
  type        = number
  description = "Defines the upper limit of CPU usage below which the Auto Scaling system will take action to scale out"
  default     = 70
}

variable "app_min_threshold" {
  type        = number
  description = "Defines the lower limit of CPU usage below which the Auto Scaling system will take action to scale in"
  default     = 20
}

# Utilities
variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

# Required from other modules 
variable "subnets_private_ids" {
  type = list(string)
}

variable "sg_internal_alb_id" {
  type = string
}
variable "sg_app_tier_id" {
  type = string
}

variable "sg_app_tier_name" {
  type = string
}
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------- #
