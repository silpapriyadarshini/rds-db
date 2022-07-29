data "aws_vpc" "lab_vpc" {
    filter {
        name   = "tag:Name"
        values = ["lab-vpc"]
    }
}

data "aws_subnet" "data_a" {
    filter {
        name   = "tag:Name"
        values = ["data-a"]
    }
}

data "aws_subnet" "data_b" {
  filter {
    name   = "tag:Name"
    values = ["data-b"]
  }
}

data "aws_security_group" "ec2_server" {
    filter {
        name    = "tag:Name"
        values  = ["ansible_server"]
  }
}

data "aws_secretsmanager_secret" "mysql_password" {
  name = "mysql_password"
}

data "aws_secretsmanager_secret_version" "mysql_passwd_version" {
  secret_id = data.aws_secretsmanager_secret.mysql_password.id
}