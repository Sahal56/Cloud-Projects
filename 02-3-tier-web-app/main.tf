# Creating 3 Tier Web App with High Availability and Elasticity

# how to include a module =>
# module "webservers" {
#    source = "../webservers"
# }

module "vpc" {
  source = "./modules/vpc.tf"
}

module "application" {
  source = "./modules/application.tf"
}

module "database" {
  source = "./modules/database.tf"
}
