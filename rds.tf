resource "aws_db_instance" "database_instance" {
    allocated_storage       = 20
    engine                  = "mysql"
    engine_version          = "8.0"
    instance_class          = "db.t3.micro"
    db_name                 = "test"
    username                = "silpa"
    password                = jsondecode(data.aws_secretsmanager_secret_version.mysql_passwd_version.secret_string)["mysql_password"]
    skip_final_snapshot     = true
    backup_retention_period = 1
    multi_az                = true
    db_subnet_group_name    = aws_db_subnet_group.database_subnet_group.name
    vpc_security_group_ids  = [aws_security_group.my_sql_server.id]
}

resource "aws_db_subnet_group" "database_subnet_group" {
  name       = "database_subnets"
  subnet_ids = [data.aws_subnet.data_a.id, data.aws_subnet.data_b.id]
  tags = {
    Name = "database_subnets"
  }
}