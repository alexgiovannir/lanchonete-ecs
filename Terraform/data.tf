locals {
  lanchonete_security_group_id = module.aws_vpc.lanchonete_security_group_id
  lanchonete_subnet_public_1_id = module.aws_vpc.lanchonete_subnet_public_1_id
  lanchonete_subnet_public_2_id = module.aws_vpc.lanchonete_subnet_public_2_id
  lanchonete_vpc_id = module.aws_vpc.lanchonete_vpc_id
}