output "lanchonete_security_group_id" {
  value = aws_security_group.lanchonete_security_group.id
}

output "lanchonete_subnet_public_1_id" {
  value = aws_subnet.lanchonete_subnet_public_1.id
}

output "lanchonete_subnet_public_2_id" {
  value = aws_subnet.lanchonete_subnet_public_2.id
}

output "lanchonete_vpc_id" {
  value = aws_vpc.lanchonete_vpc.id
}