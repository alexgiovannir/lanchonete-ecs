data "aws_security_group" "lanchonete_security_group" {
  filter{
    name = "group-name"
    values = [data.aws_security_group.lanchonete_security_group.id]
  }
}

data "aws_subnet" "lanchonete_subnet_public_1" {
  filter{
    name = "subnet-name-1"
    values = [data.aws_subnet.lanchonete_subnet_public_1.id]
  }
}

data "aws_subnet" "lanchonete_subnet_public_2" {
  filter{
    name = "subnet-name-2"
    values = [data.aws_subnet.lanchonete_subnet_public_2.id]
  }
}

data "aws_vpc" "lanchonete_vpc" {
  filter{
    name = "vpc-name"
    values = [data.aws_vpc.lanchonete_vpc.id]
  }
}