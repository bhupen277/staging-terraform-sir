output "subnet_id" {
  value = "aws_subnet.private_subnet_id"
}

output "subnet_id" {
  value = "aws_subnet.public_subnet_id"
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

# It is not neccessory to use call the both o/p, we call it according to requirement