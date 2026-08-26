terraform {
  required_version = ">= 1.11"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    # bucket is supplied via -backend-config on init
    key          = "odoo-eks/01-cluster/terraform.tfstate"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "odoo-eks"
      Environment = "test"
      ManagedBy   = "terraform"
    }
  }
}
