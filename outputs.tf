output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "rds_instance" {
  value = {
    endpoint = aws_db_instance.main.address
    port     = aws_db_instance.main.port
    username = aws_db_instance.main.username
    password = random_string.db_master.result
  }
}
