provider "aws" {
    region = var.region
    access_key = "my-access-key"
    secret_key = "my-secret-key"
    profile                  = "config"
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
