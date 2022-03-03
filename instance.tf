resource "aws_instance" "simpleweb" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.INSTANCE_TYPE
  tags = {
    Name = "Simple Web"
  }

  # security group
  vpc_security_group_ids = [aws_security_group.simpleweb_sg.id]

  # public SSH key
  key_name = aws_key_pair.simpleweb_keypair.key_name
}