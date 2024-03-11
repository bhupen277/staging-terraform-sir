variable "project" {
  default = "MotoGP"
  description = "providing my project name"
}

variable "region" {
  default = "us-west-2"
  description = "providing region to my server"
}

variable "vpc_cidr" {
  default = 10.0.0.0/16
  description = "providing my vpc ip"
}

variable "enviorment" {
  default = "Production"
  description = "providing enviorment for my project"
}

variable "private_subnet_cidr" {
  default = 10.10.0.0/20
  description = "providing my private subnet cidr"
}

variable "public_subnet_cidr" {
  default = 10.0.16.0/20
  description = "providing my public subnet module"
}

#

variable "ami" {
  default = "ami-0eb5115914ccc4bc2"
  description = "providing the image id to for server creation"
}

variable "instance_type" {
  default = "t2.micro"
  description = "providing the server size to my instance"
}

variable "key_name" {
  default = "windows_global_key"
  description = "providing the key key pair to my server "
}





