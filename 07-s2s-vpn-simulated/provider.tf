# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Note: You can have state locking with S3+DynamoDB or Latest terraform supports with S3 only. I have omitted that because of personal project to avoid S3 API costs
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # If you need to save the state
  # backend "s3" {
  #   bucket         = "" # Your S3 Bucket
  #   key            = ""
  #   region         = var.region
  #   dynamodb_table = "" # Your DynamoDB Table
  # }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
