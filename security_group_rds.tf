resource "aws_security_group" "rds" {
  name   = "rds-sg"
  vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group_rule" "rds_mysql_ingress_ecs" {
  description              = "any/any rule to permit ingress from the ecs service"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds.id
  source_security_group_id = aws_security_group.ecs.id
}
