terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.46.0"
    }
  }
}

### SVCS TF Assume Role ###
provider "aws" {
  region = var.aws_region
  alias  = "svcs"
  assume_role {
    role_arn = "arn:aws:iam::${var.svcs_account}:role/tf/${var.env}-TerraformExecutionRole"
  }
}
