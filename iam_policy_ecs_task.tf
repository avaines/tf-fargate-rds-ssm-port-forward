data "aws_iam_policy_document" "ecs_task" {
  statement {
    sid    = "AllowIntegrationWithSsm"
    effect = "Allow"

    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "ecs_task" {
  name        = "ecs-task"
  description = "ECS Task Role for the ECS task"
  policy      = data.aws_iam_policy_document.ecs_task.json
}

resource "aws_iam_role_policy_attachment" "ecs_task" {
  role       = aws_iam_role.ecs_task.id
  policy_arn = aws_iam_policy.ecs_task.arn
}
