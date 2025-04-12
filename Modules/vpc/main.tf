resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = "${var.environment}-vpc"
  }
}

resource "aws_subnet" "main1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1_cidr

  tags = {
    Name = "${var.environment}-subnet1"
  }
}

variable vpc_cidr {}
variable subnet1_cidr {}
variable environment {}