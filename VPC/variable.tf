variable "region" {
  type = "string"
  description = "providing my refion for project"
}

variable "terraform-backend" {
  type = string
  description = "providing my backend bucket name"
}

variable "cidr_block" {
  type = number
  description = "providing vpc IP address"
}