terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket               = "devops-recipe-app-udemy"
    key                  = "tf-state-deploy"
    workspace_key_prefix = "tf-state-deploy-env"
    region               = "us-east-2"
    encrypt              = true
    dynamodb_table       = "deveops-recipe-app-udemy-lock"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      Contact     = var.contact
      ManageBy    = "Terraform/deploy"
    }
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
}

data "aws_region" "current" {}


# Commands to run:

# AWS Connect:
# aws-vault exec zzimmerman    # connect to AWS

# Terraform:
# cd C:\Users\ZacharyZimmerman\Documents\Repositories\devops-recipe-app-api-starting-point\infra

# SETUP
# docker compose run --rm terraform -chdir=setup init    # initialize the setup
# docker compose run --rm terraform -chdir=setup validate    # validate the code
# docker compose run --rm terraform -chdir=setup fmt    # format the code
# docker compose run --rm terraform -chdir=setup plan    # plan the code
# docker compose run --rm terraform -chdir=setup apply    # apply the code
# docker compose run --rm terraform -chdir=setup destroy    # destroy the code

# DEPLOY
# docker compose run --rm terraform -chdir=deploy init    # initialize the setup
# docker compose run --rm terraform -chdir=deploy validate    # validate the code
# docker compose run --rm terraform -chdir=deploy fmt    # format the code
# docker compose run --rm terraform -chdir=deploy plan    # plan the code
# docker compose run --rm terraform -chdir=deploy apply    # apply the code
# docker compose run --rm terraform -chdir=deploy destroy    # destroy the code