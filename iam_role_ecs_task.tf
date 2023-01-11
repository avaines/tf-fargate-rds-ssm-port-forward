data "aws_iam_policy_document" "ecs_task_assumerole" {
  statement {
    sid    = "AllowEC2AssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "ecs-tasks.amazonaws.com",
      ]
    }
  }
}

resource "aws_iam_role" "ecs_task" {
  name               = "ecs-task-assumerole"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assumerole.json
}
