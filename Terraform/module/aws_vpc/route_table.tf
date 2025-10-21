resource "aws_route_table" "lanchonete_route_table_public" {
  vpc_id = aws_vpc.lanchonete_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lanchonete_internet_gateway.id
  }

  tags = {
    Name = "lanchonete-route-table-public"
  }
}

resource "aws_route_table_association" "assoc_subnet_public_1" {
  subnet_id      = aws_subnet.lanchonete_subnet_public_1.id
  route_table_id = aws_route_table.lanchonete_route_table_public.id
}

resource "aws_route_table_association" "assoc_subnet_public_2" {
  subnet_id      = aws_subnet.lanchonete_subnet_public_2.id
  route_table_id = aws_route_table.lanchonete_route_table_public.id
}