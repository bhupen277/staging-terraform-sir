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
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "${var.project}-igw"
    enviorment = var.enviorment
  }
}

# Need the default-RT for VPC
    # aws_default_route_table: It will create using the pre existing mentioned vpc.id
    # aws_route_table: It will create a new route table

resource "aws_default_route_table" "example" {
  default_route_table_id = aws_vpc.example.default_route_table_id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  }

  tags = {
    Name = "example"
  }
}