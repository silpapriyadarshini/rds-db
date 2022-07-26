resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "silpa"
  password             = "Silpa1993"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}