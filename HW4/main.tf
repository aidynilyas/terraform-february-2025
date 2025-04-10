resource "aws_vpc" "main" {
  cidr_block           = var.forVpc.cidr_block
  enable_dns_hostnames = var.forVpc.enable_dns_hostnames
  enable_dns_support   = var.forVpc.enable_dns_support

  tags = local.tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = merge(local.tags, { Name = var.forIgw })
}

resource "aws_subnet" "a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnets[0].cidr_block
  availability_zone       = var.subnets[0].availability_zone
  map_public_ip_on_launch = var.subnets[0].auto_assign_public_ip

  tags = merge(local.tags, { Name = var.subnets[0].name })
}

resource "aws_subnet" "b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnets[1].cidr_block
  availability_zone       = var.subnets[1].availability_zone
  map_public_ip_on_launch = var.subnets[1].auto_assign_public_ip

  tags = merge(local.tags, { Name = var.subnets[1].name })
}

resource "aws_subnet" "c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnets[2].cidr_block
  availability_zone       = var.subnets[2].availability_zone
  map_public_ip_on_launch = var.subnets[2].auto_assign_public_ip

  tags = merge(local.tags, { Name = var.subnets[2].name })
}

resource "aws_subnet" "d" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnets[3].cidr_block
  availability_zone       = var.subnets[3].availability_zone
  map_public_ip_on_launch = var.subnets[3].auto_assign_public_ip

  tags = merge(local.tags, { Name = var.subnets[3].name })
}

resource "aws_route_table" "publicRt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(local.tags, { Name = var.forRt[0] })
}

resource "aws_route_table" "privateRt" {
  vpc_id = aws_vpc.main.id

  tags = merge(local.tags, { Name = var.forRt[1] })
}

resource "aws_route_table_association" "rt_assoc_a" {
  subnet_id      = aws_subnet.a.id
  route_table_id = aws_route_table.publicRt.id
}

resource "aws_route_table_association" "rt_assoc_b" {
  subnet_id      = aws_subnet.b.id
  route_table_id = aws_route_table.publicRt.id
}

resource "aws_route_table_association" "rt_assoc_c" {
  subnet_id      = aws_subnet.c.id
  route_table_id = aws_route_table.privateRt.id
}

resource "aws_route_table_association" "rt_assoc_d" {
  subnet_id      = aws_subnet.d.id
  route_table_id = aws_route_table.privateRt.id
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer"
  public_key = file("~/.ssh/id_rsa.pub")
  tags       = local.tags
} 

resource "aws_instance" "web" {
  ami                    = var.forEc2.ami_id
  instance_type          = var.forEc2.instance_type
  subnet_id              = aws_subnet.a.id
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = merge(local.tags, { Name = "wordpress-server" })
}
