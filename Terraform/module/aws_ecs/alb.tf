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
  security_groups = [data.aws_security_group.lanchonete_security_group.id]
  subnets = [
    data.aws_subnet.lanchonete_subnet_public_1,
    data.aws_subnet.lanchonete_subnet_public_2
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
  vpc_id = data.aws_vpc.lanchonete_vpc.id

  health_check {
    path = "/"
  }
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