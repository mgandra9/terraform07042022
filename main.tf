provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAZZ3HYKFNYRVGBTXM"
  secret_key = "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"
}

resource "aws_vpc" "st-vpc" {
  cidr_block = var.cidr-block[0]

  tags = {
    Name = "st"
  }
}
output "st-vpc" {
  value = aws_vpc.st-vpc.arn
}


resource "aws_subnet" "st-subnet-1" {
  vpc_id            = aws_vpc.st-vpc.id
  cidr_block        = var.cidr-block[1]
  availability_zone = "us-east-1a"

  tags = {
    Name = "st-subnet-1"
  }
}

data "aws_vpc" "default_vpc" {
  default = "true"
}

resource "aws_subnet" "subnet-2" {
  vpc_id            = data.aws_vpc.default_vpc.id
  cidr_block        = "172.31.200.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "test"
    env  = "test"
  }
}