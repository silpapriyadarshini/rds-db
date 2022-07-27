data "aws_vpc" "lab-vpc" {
    filter {
        name   = "tag:Name"
        values = ["lab-vpc"]
    }
}

data "aws_subnet" "data1" {
    filter {
        name   = "tag:Name"
        values = ["data1"]
    }
}

data "aws_subnet" "data2" {
    filter {
        name   = "tag:Name"
        values = ["data2"]
    }
}

data "aws_security_group" "ec2_server" {
    filter {
        name    = "tag:Name"
        values  = ["ansible_server"]
  }
}

data "aws_secretsmanager_secret" "my_db_passwrd" {
  name = "my_db_passwrd"
}

data "aws_secretsmanager_secret_version" "my_sql_passwrd_version" {
  secret_id = data.aws_secretsmanager_secret.my_db_passwd.id
}