# -------------------------------------------------------------------- EC2(Web Tier) variables -------------------------------------------------------------------- #

variable "web_ami_id" {
  type        = string
  description = "EC2 AMI id for Web Tier"
}

variable "web_ec2_type" {
  type        = string
  description = "Instance type for Web Tier"
  default     = "t2.micro"
}

variable "web_dev_name" {
  type        = string
  description = "Device name for the volume of EC2 instances running in the Web Tier"
  default     = "/dev/xvda"
}

variable "web_ebs_vol_size" {
  type        = string
  description = "Size of EBS Storage Volume"
  default     = "8"
}

variable "web_ebs_vol_type" {
  type        = string
  description = "Type of EBS Storage Volume"
  default     = "gp3"
}

variable "web_asg_min" {
  type        = number
  description = "Minimum number of instances in the ASG in the Web Tier"
  default     = 1
}

variable "web_asg_desired" {
  type        = number
  description = "Desired number of instances in the ASG in the Web Tier"
  default     = 1
}

variable "web_asg_max" {
  type        = number
  description = "Maximum number of instances in the ASG in the Web Tier"
  default     = 3
}

variable "web_asg_health_check_type" {
  type        = string
  description = "Health Check type EC2 or ELB"
  default     = "ELB"
}

variable "web_max_threshold" {
  type        = number
  description = "Defines the upper limit of CPU usage below which the Auto Scaling system will take action to scale out"
  default     = 70
}

variable "web_min_threshold" {
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
variable "subnets_public_ids" {
  type = list(string)
}

variable "sg_alb_id" {
  type = string
}

variable "sg_web_tier_id" {
  type = string
}

variable "sg_web_tier_name" {
  type = string
}
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------- #
