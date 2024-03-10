# here we create only resources and providers are defined into the projet's module main.tf file
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.project}-vpc"
    enviorment = var.enviorment  
  }
}

# here we creating the private subnet of our vpc & refering the vpc_id using attribute
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.16.0/20"

  tags = {
    Name = "${var.project}-private-subnet"
    enviorment = var.enviorment
  }
}

# here we creating the public subnet of our vpc & refering the vpc_id using attribute
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/20"

  tags = {
    Name = "${var.project}-private-subnet"
    enviorment = var.enviorment
  }
  map_public_ip_on_launch = "true"   # by default our server is in private & but public server made public using the enable the public ip. 
}

# Need internet gateway to provide the internet to my public subnet
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}