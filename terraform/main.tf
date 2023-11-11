terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "aws-vod-tf-state"
    key    = "tf-state"
    region = "us-east-2"
  }
  required_version = ">=1.6.1"
}

provider "aws" {
  region = "us-east-2"
}

module "ecr" {
  source = "github.com/aws-vod-service/aws-ecr-repo-module"

  name         = "vod-portal-ecr-image"
  force_delete = true
}