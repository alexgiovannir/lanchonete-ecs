terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.99.1"
    }
  }
}
resource "aws_lb" "ecs_alb" {
  name = "ecs-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [var.lanchonete_security_group_id]
  subnets = [
    var.lanchonete_subnet_public_1_id,
    var.lanchonete_subnet_public_2_id
  ]
  tags = {
    Name = "ecs-alb"
  }
}

resource "aws_lb_target_group" "ecs_tg" {
  name = "lanchonete-tg"
  port = 80
  protocol = "HTTP"
  target_type = "ip"
  vpc_id = var.lanchonete_vpc_id
}

resource "aws_lb_listener" "ecs_alb_listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }
}