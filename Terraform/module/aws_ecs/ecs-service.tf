resource "aws_ecs_service" "ecs_service" {
  name = "lanchonete-svc"
  cluster = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count = 2

  network_configuration {
    security_groups = [var.lanchonete_security_group_id]
    subnets = [
      var.lanchonete_subnet_public_1_id,
      var.lanchonete_subnet_public_2_id
    ]
  }

  force_new_deployment = true

  triggers = {
    redeployment = timestamp()
  }

  launch_type     = "FARGATE" # This is important for the capacity provider strategy to work

  capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    weight            = 100 # 100% of tasks on Fargate Spot
    base              = 0
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name = "lanchonete-ctr"
    container_port = 80
  }

}