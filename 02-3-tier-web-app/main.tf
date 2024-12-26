
module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name

  netw_cidr            = var.netw_cidr
  vpc_azs              = var.vpc_azs
  subnet_public_cidrs  = var.subnet_public_cidrs
  subnet_private_cidrs = var.subnet_private_cidrs
  subnet_db_cidrs      = var.subnet_db_cidrs
}

module "route_tables" {
  source       = "./modules/route_tables"
  project_name = var.project_name
  netw_cidr    = var.netw_cidr

  vpc_id               = module.vpc.vpc_id
  ig_id                = module.vpc.ig_id
  subnets_public_ids   = module.vpc.subnets_public_ids
  subnets_private_ids  = module.vpc.subnets_private_ids
  subnets_database_ids = module.vpc.subnets_database_ids
}

module "security_groups" {
  source       = "./modules/security_groups"
  project_name = var.project_name

  vpc_id = module.vpc.vpc_id
}

data "aws_iam_user" "iam_user" {
  user_name = var.user_name
}

module "s3" {
  source         = "./modules/s3"
  project_name   = var.project_name
  s3_bucket_name = var.s3_bucket_name
  region         = var.region

  user_arn      = data.aws_iam_user.iam_user.arn
  ec2_role_arn  = module.iam.ec2_role_arn
  vpc_id        = module.vpc.vpc_id
  rt_public_id  = module.route_tables.rt_public_id
  rt_private_id = module.route_tables.rt_private_id
}

module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
}

module "database" {
  source       = "./modules/database"
  project_name = var.project_name

  subnets_database_ids = module.vpc.subnets_database_ids
}

module "nat" {
  source        = "./modules/nat_gw"
  project_name  = var.project_name
  subnet_id_NAT = "your-subnet-id"

}

module "app_tier" {
  source       = "./modules/app_tier"
  project_name = var.project_name

  vpc_id              = module.vpc.vpc_id
  subnets_private_ids = module.vpc.subnets_private_ids
  sg_internal_alb_id  = module.security_groups.sg_internal_alb_id
  sg_app_tier_id      = module.security_groups.sg_app_tier_id
  # not required name
  sg_app_tier_name = module.security_groups.sg_app_tier_name

  # created using AWS Management Console
  app_ami_id = "your-app-tier-ami-id"
}


module "web_tier" {
  source       = "./modules/web_tier"
  project_name = var.project_name

  vpc_id             = module.vpc.vpc_id
  subnets_public_ids = module.vpc.subnets_public_ids
  sg_alb_id          = module.security_groups.sg_alb_id

  # not required name
  sg_web_tier_name = module.security_groups.sg_web_tier_name
  sg_web_tier_id   = module.security_groups.sg_web_tier_id

  # created using AWS Management Console
  web_ami_id = "your-web-tier-ami-id"
}
