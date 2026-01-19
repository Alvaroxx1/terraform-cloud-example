terraform {
  cloud {
    organization = "terraform-org-ajdev "

    workspaces {
      name = "terraform-vcs"
    }
  }

  required_providers {


    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
} 