resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/lanchonete-ctr"
  retention_in_days = 30
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                = "lanchonete-family"
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = "arn:aws:iam::961624804946:role/ecs-adm-role"
  task_role_arn            = "arn:aws:iam::961624804946:role/ecs-adm-role"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name = "lanchonete-ctr"
    image = "961624804946.dkr.ecr.us-east-1.amazonaws.com/lanchonete-repository:latest"
    essencial = true
    portMappings = [{
      containerPort = 8080
      hostPost = 8080
      protocol = "tcp"
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = aws_cloudwatch_log_group.ecs_logs.name
        "awslogs-region"        = "us-east-1"
        "awslogs-stream-prefix" = "ecs"
      }
    }
  }])
}