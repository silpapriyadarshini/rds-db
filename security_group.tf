resource "aws_security_group" "my_sql_server" {
  name        = "mysql_server"
  description = "Allow connection for Mysql Server"
  vpc_id      = data.aws_vpc.lab-vpc.id

  ingress {
    description      = "Allow port 3306"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [data.aws_security_group.ec2_server.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "my-sql-server-sg"
  }
}
