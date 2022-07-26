data "aws_subnet" "private1" {
    filter {
        name   = "tag:Name"
        values = ["private1"]
    }
}

data "aws_subnet" "private2" {
    filter {
        name   = "tag:Name"
        values = ["private2"]
    }
}