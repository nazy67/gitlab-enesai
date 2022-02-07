terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "svcs-infra-ue1-s3-tfst-001"
    key            = "svcs/infra/gitlab.tfstate"
    region         = "us-east-1"
    dynamodb_table = "svcs-infra-ue1-ddb-tfst-001"
  }
}
