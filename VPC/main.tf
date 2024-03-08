provider "aws" {
    region = var.region
    shared_config_files      = ["/Users/tf_user/.aws/conf"]
  shared_credentials_files = ["/Users/tf_user/.aws/creds"]
  profile                  = "customprofile"
}

terraform {
  backend "s3" {
    bucket = "terraform.tfstateoregon"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-staging"
  }
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = "$(MotoGP).VPC"
  }
}
