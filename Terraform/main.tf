module "aws_vpc" {
  source = "./module/aws_vpc"
}

module "aws_ecs" {
  source = "./module/aws_ecs"
  lanchonete_security_group_id = local.lanchonete_security_group_id
  lanchonete_subnet_public_1_id = local.lanchonete_subnet_public_1_id
  lanchonete_subnet_public_2_id = local.lanchonete_subnet_public_2_id
  lanchonete_vpc_id = local.lanchonete_vpc_id
}