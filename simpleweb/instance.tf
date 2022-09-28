resource "aws_instance" "simpleweb" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.INSTANCE_TYPE
  tags = {
    Name = "Simple Web"
  }

  # VPC subnet
  subnet_id = aws_subnet.tf_public_a.id

  # security group
  vpc_security_group_ids = [aws_security_group.simpleweb_sg.id]

  # public SSH key
  key_name = aws_key_pair.simpleweb_keypair.key_name

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}