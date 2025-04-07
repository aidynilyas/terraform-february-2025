# Lookup Ubuntu and Amazon Linux AMIs
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["137112412989"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# EC2 Instances
resource "aws_instance" "ubuntu_instance" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name                    = aws_key_pair.bastion.key_name 

  tags = { Name = "Ubuntu" }

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install apache2 -y
              echo "Hello from Ubuntu!" > /var/www/html/index.html
              systemctl start apache2
              systemctl enable apache2
              EOF
}

resource "aws_instance" "amazon_instance" {
  ami                         = data.aws_ami.amazon.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public2.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name                    = aws_key_pair.bastion.key_name 

  tags = { Name = "Amazon" }

 user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              echo "Hello from Amazon Linux!" > /var/www/html/index.html
              systemctl start httpd
              systemctl enable httpd
              EOF
}

output "ubuntu_instance_public_ip" {
  value = aws_instance.ubuntu_instance.public_ip
}

output "amazon_instance_public_ip" {
  value = aws_instance.amazon_instance.public_ip
}