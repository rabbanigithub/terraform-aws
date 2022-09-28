# Internet VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block           = "10.20.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "Terraform VPC"
  }
}

# Subnets
resource "aws_subnet" "tf_public_a" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = "10.20.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AWS_REGION}a"

  tags = {
    Name = "terraform public a"
  }
}

resource "aws_subnet" "tf_public_b" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = "10.20.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AWS_REGION}b"

  tags = {
    Name = "terraform public b"
  }
}

resource "aws_subnet" "tf_public_c" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = "10.20.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AWS_REGION}c"

  tags = {
    Name = "terraform public c"
  }
}

resource "aws_subnet" "tf_private_a" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = "10.20.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.AWS_REGION}a"

  tags = {
    Name = "terraform private a"
  }
}

resource "aws_subnet" "tf_private_b" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = "10.20.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.AWS_REGION}b"

  tags = {
    Name = "terraform private b"
  }
}

resource "aws_subnet" "tf_private_c" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = "10.20.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.AWS_REGION}c"

  tags = {
    Name = "terraform private c"
  }
}

# Internet GW
resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = "Terraform IGW"
  }
}

# route tables
resource "aws_route_table" "tf_public" {
  vpc_id = aws_vpc.tf_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }

  tags = {
    Name = "Terraform Public"
  }
}

# route associations public
resource "aws_route_table_association" "tf_public_a_1" {
  subnet_id      = aws_subnet.tf_public_a.id
  route_table_id = aws_route_table.tf_public.id
}

resource "aws_route_table_association" "tf_public_b_1" {
  subnet_id      = aws_subnet.tf_public_b.id
  route_table_id = aws_route_table.tf_public.id
}

resource "aws_route_table_association" "tf_public_c_1" {
  subnet_id      = aws_subnet.tf_public_c.id
  route_table_id = aws_route_table.tf_public.id
}

