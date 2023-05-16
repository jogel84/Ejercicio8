resource "aws_db_instance" "base_datos" {
  allocated_storage       = 10
  db_name                 = var.rds_dbname
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t3.micro"
  username                = var.rds_user
  password                = var.rds_password
  parameter_group_name    = "default.mysql5.7"
  vpc_security_group_ids  = [aws_security_group.allow_ssh_http_mysql.id]
  db_subnet_group_name    = aws_db_subnet_group.subnet_db.id
  skip_final_snapshot     = true
}

resource "aws_db_subnet_group" "subnet_db" {
  name       = "main"
  subnet_ids = [aws_subnet.sub_net_us-east-1a.id, aws_subnet.sub_net_us-east-1b.id]

  tags = {
    Name = "Grupo de subnets para BD"
  }
}