resource "aws_ecs_task_definition" "main" {
  family                   = "service"
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.ecs_task.arn
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512

  container_definitions = jsonencode([
    {
      name      = "main"
      image     = "public.ecr.aws/docker/library/httpd:latest"
      essential = true
    }
  ])
}
