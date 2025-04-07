resource "aws_instance" "web" {
  count         = 3
  ami           = "ami-03f8acd418785369b"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = aws_key_pair.bastion.key_name
  associate_public_ip_address = true
  user_data = file("userdata.sh")
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "Web-${count.index + 1}"
  }
}


output ec2_public_ip {
  value = aws_instance.web[*].public_ip
}

resource "aws_key_pair" "bastion" {
  key_name   = "bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}