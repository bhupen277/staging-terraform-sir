provider "aws" {
    region = var.region
    shared_config_files      = ["/home/ubuntu/.aws/config"]
    shared_credentials_files = ["/home/ubuntu/.aws/creds"]
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
