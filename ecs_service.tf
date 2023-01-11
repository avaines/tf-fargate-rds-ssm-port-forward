resource "aws_ecs_service" "main" {
  name = "main"

  cluster                = aws_ecs_cluster.main.id
  desired_count          = 1
  enable_execute_command = true
  launch_type            = "FARGATE"
  task_definition        = aws_ecs_task_definition.main.arn

  network_configuration {
    subnets          = data.aws_subnets.default.ids
    security_groups  = [aws_security_group.ecs.id]
    assign_public_ip = true
  }
}
