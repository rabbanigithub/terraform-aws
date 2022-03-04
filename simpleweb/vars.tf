variable "AWS_REGION" {
  default = "us-east-2"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "simpleweb_sshkey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "simpleweb_sshkey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-033b95fb8079dc481"
    us-east-2 = "ami-0b614a5d911900a9b"
    us-west-1 = "ami-0573b70afecda915d"
  }
}

variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}