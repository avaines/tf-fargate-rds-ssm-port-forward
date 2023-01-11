resource "random_string" "db_master" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "main" {
  allocated_storage      = 10
  db_name                = "main"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  parameter_group_name   = "default.mysql5.7"
  password               = random_string.db_master.result
  skip_final_snapshot    = true
  username               = "master"
  vpc_security_group_ids = [aws_security_group.rds.id]
}
