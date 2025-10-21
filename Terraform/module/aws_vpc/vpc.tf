resource "aws_vpc" "lanchonete_vpc" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "lanchonete-vpc"
  }
}

resource "aws_subnet" "lanchonete_subnet_public_1" {
  vpc_id                  = aws_vpc.lanchonete_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "lanchonete-subnet-public-1"
    Type = "public"
  }
}

resource "aws_subnet" "lanchonete_subnet_public_2" {
  vpc_id                  = aws_vpc.lanchonete_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "lanchonete-subnet-public-2"
    Type = "public"
  }
}

resource "aws_security_group" "lanchonete_security_group" {
  name        = "lanchonete-security-group"
  description = "Security group de acesso geral"
  vpc_id      = aws_vpc.lanchonete_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self = "false"
    cidr_blocks = ["0.0.0.0/0"]
    description = "any"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "lanchonete-security-group"
  }
}