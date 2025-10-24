resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                = "lanchonete-family"
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = "arn:aws:iam::961624804946:role/ecs-adm-role"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name = "lanchonete-ctr"
    image = "961624804946.dkr.ecr.us-east-1.amazonaws.com/lanchonete-repository:latest"
    essencial = true
    portMappings = [{
      containerPort = 80
      hostPost = 80
      protocol = "tcp"
    }]
  }])
}