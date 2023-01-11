resource "aws_security_group" "ecs" {
  name   = "ecs-sg"
  vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group_rule" "ecs_egress_any" {
  description       = "any/any rule to permit egress"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  security_group_id = aws_security_group.ecs.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ecs_http_ingress_any" {
  description       = "any/any rule to permit http ingress"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.ecs.id
  cidr_blocks       = ["0.0.0.0/0"]
}
