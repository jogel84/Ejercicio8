resource "aws_db_instance" "base_datos" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "root"
  password             = "root1234@"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}