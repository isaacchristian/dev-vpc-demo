# terraform.tf 

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.48.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

terraform {
  cloud {
    organization = "dev-demo-1"
    workspaces {
      name = "demo-workspace"
    }
  }
  required_version = ">=1.1.0"
}