resource "aws_instance" "foo" {
  ami           = var.image_id # us-west-2
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}
