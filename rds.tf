resource "aws_db_instance" "my-database" {
    allocated_storage       = 20
    engine                  = "mysql"
    engine_version          = "8.0"
    instance_class          = "db.t3.micro"
    name                    = "test"
    username                = "silpa"
    password                = "Silpa@1993"
    parameter_group_name    = "my-database.mysql8.0"
    skip_final_snapshot     = true
    multi_az                = var.multi_az
    backup_retention_period = 1
}

resource "aws_db_subnet_group" "subnet_grp" {
  name       = "db_subnet_group"
  subnet_ids = ["${data.aws_subnet.private1.id}", "${data.aws_subnet.private2.id}"]

  tags = {
    Name = "My DB subnet group"
  }
}