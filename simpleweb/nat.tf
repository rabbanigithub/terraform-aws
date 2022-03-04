# nat elastic ip
resource "aws_eip" "tf_nat_eip" {
  vpc = true
}

# nat gateway
resource "aws_nat_gateway" "tf_nat_gw" {
  allocation_id = aws_eip.tf_nat_eip.id
  subnet_id     = aws_subnet.tf_public_a.id
  depends_on    = [aws_internet_gateway.terraform_igw]
}

# VPC setup for NAT
resource "aws_route_table" "tf_private" {
  vpc_id = aws_vpc.tf_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.tf_nat_gw.id
  }

  tags = {
    Name = "terraform private"
  }
}

# route associations private
resource "aws_route_table_association" "tf_private_a_1" {
  subnet_id      = aws_subnet.tf_private_a.id
  route_table_id = aws_route_table.tf_private.id
}

resource "aws_route_table_association" "tf_private_b_1" {
  subnet_id      = aws_subnet.tf_private_b.id
  route_table_id = aws_route_table.tf_private.id
}

resource "aws_route_table_association" "tf_private_c_1" {
  subnet_id      = aws_subnet.tf_private_c.id
  route_table_id = aws_route_table.tf_private.id
}

