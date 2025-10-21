resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                = "lanchonete-family"
  network_mode = "awsvpc"
  execution_role_arn = "arn:aws:iam::961624804946:role/adm-role"
  cpu = 1024
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture = "X86_64"
  }
  container_definitions = jsondecode([{
    name = "lanchonete-ctr"
    image = "strm/helloworld-htpp"
    cpu = 1024
    memory = 256
    essencial = true
    portMappings = [{
      containerPort = 80
      hostPost = 80
      protocol = "tcp"
    }]
  }])
}