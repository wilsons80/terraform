terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.0"
    }
  }

  backend "s3" {
    bucket = "comunidadedevops-s3-terraform"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}