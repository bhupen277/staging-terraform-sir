provider "aws" {
    region = var.region
    access_key = "AKIA3E7G3SLOTRORYO5I"
    secret_key = "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"
#    profile    = "config"
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
