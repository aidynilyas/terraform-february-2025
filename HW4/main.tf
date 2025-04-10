resource "aws_key_pair" "deployer" {
  key_name   = "deployer"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = local.tags
}

resource "aws_vpc" "main" {
  cidr_block       = var.forVpc.cidr_block
  enable_dns_hostnames = var.forVpc.enable_dns_hostnames
  enable_dns_support = var.forVpc.enable_dns_support

  tags = local.tags
}

resource "aws_route_table" "publicRt" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table" "privateRt" {
  vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnets[0].cidr_block
  availability_zone = var.subnets[0].availability_zone
  auto_assign_public_ip = var.subnets[0].auto_assign_public_ip
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = local.tags
}

resource "aws_subnet" "b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnets[1].cidr_block
  availability_zone = var.subnets[1].availability_zone
  auto_assign_public_ip = var.subnets[1].auto_assign_public_ip
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = local.tags
}

resource "aws_subnet" "c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnets[2].cidr_block
  availability_zone = var.subnets[2].availability_zone
  auto_assign_public_ip = var.subnets[2].auto_assign_public_ip
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = local.tags
}

resource "aws_subnet" "d" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnets[3].cidr_block
  availability_zone = var.subnets[3].availability_zone
  auto_assign_public_ip = var.subnets[3].auto_assign_public_ip
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = local.tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  name = var.forIgw
}