resource "aws_instance" "foo" {
  ami           = var.image_id # us-west-2
  instance_type = var.instance_type
se
}
