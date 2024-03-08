provider "aws" {
    region = var.region
    shared_config_files      = ["/home/ubuntu/.aws/config"]
    shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
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











resource "aws_instance" "server" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name = "HelloWorld"
  }
}

