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

variable vpc_cidr {
  default = "10.0.0.0/16"
  type = string
}
variable subnet1_cidr {
  default = "10.0.1.0/24"
  type = string
}
variable environment {
  default = "dev"
  type = string
}

output subnet_id {
  value = aws_subnet.main1.id
}