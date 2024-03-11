provider "aws" {
    region = var.region
    shared_config_files      = ["/home/ubuntu/.aws/config"]
    shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
    profile                  = "config"
}

terraform {
  backend "s3" {
    bucket = "staging-terraformm/ts-state"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-staging"
  }
}

# now we are calling the module from that folder

module "my_vpc_module" {
  source = "./modules/vpc"
  project = var.project
  vpc_cidr = var.vpc_cidr
  enviorment = var.enviorment
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr = var.public_subnet_cidr
}

# anyway: here also we can create resource (security group)
resource "aws_security_group" "my_sg" {
  name        = "${var.project}-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id
  vpc_id      = module.my_vpc_module.id 

  tags = {
    Name = "allow_tls"
  }
}



# Instance creating in public subnet by calling o/p
module "my_instance" {
  source = "./modules/instance"
  count = var.count
  ami = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  project = var.project
  enviorment = var.enviorment
  subnet_id = module.my_vpc_module.public_subnet_id  # it will create from vpc when vpc will create & this id will only bounded with vpc directory if we want sg_id from vpc so we need to use the "output_block"
  sg_ids = 
}

# # Instance creating in private subnet by calling o/p
# module "my_instance_private" {
#   source = "./modules/instance"
#   count = var.count
#   ami = var.image_id
#   instance_type = var.instance_type
#   key_name = var.key_name
#   project = var.project
#   enviorment = var.enviorment
#   subnet_id = module.my_vpc_module.private_subnet_id  # it will create from vpc when vpc will create & this id will only bounded with vpc directory if we want sg_id from vpc so we need to use the "output_block"
#   sg_ids = 
# }