resource "aws_db_instance" "database-instance" {
    allocated_storage       = 20
    identifier              = "testinstance"
    engine                  = "mysql"
    engine_version          = "8.0"
    instance_class          = "db.t3.micro"
    name                    = "test"
    username                = "silpa"
    password                = "Silpa@1993"
    parameter_group_name    = "database-instance.mysql8.0"
    skip_final_snapshot     = true
    db_subnet_group_name    = "aws_db_subnet_group.database-subnet-group.id"
    backup_retention_period = 1
    multi_az                = var.multi_az
}

resource "aws_db_subnet_group" "database-subnet-group" {
  name       = "database-subnets"
  subnet_ids = ["aws_subnet.private.id", "aws_subnet.private1.id"]

  tags = {
    Name = "db-subnet-group"
  }
}

data "aws_db_snapshot" "db_snapshot" {
  most_recent = true
  db_instance_identifier = "testinstance"
}