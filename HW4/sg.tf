resource "aws_security_group" "sg" {
  name   = "wordpress-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port        = var.ports[0]
    to_port          = var.ports[0]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = var.ports[1]
    to_port          = var.ports[1]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = var.ports[2]
    to_port          = var.ports[2]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = var.ports[3]
    to_port          = var.ports[3]
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }



  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = local.tags
}
