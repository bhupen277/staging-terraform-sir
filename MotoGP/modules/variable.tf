variable "project" {
  default = "MotoGP"
  description = "providing my project name"
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

variable "count" {
  default = 2
  description = "providing no of resource"
}

