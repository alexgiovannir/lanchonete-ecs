resource "aws_internet_gateway" "lanchonete_internet_gateway" {
  vpc_id = aws_vpc.lanchonete_vpc.id

  tags = {
    Name = "lanchonete-internet-gateway"
  }
}