resource "aws_key_pair" "simpleweb_keypair" {
  key_name   = "simpleweb_keypair"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}