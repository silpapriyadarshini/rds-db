data "aws_subnet" "private" {
    filter {
        name   = "tag:Name"
        values = ["private"]
    }
}

data "aws_subnet" "private1" {
    filter {
        name   = "tag:Name"
        values = ["private1"]
    }
}