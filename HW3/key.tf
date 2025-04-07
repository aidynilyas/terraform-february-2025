resource "aws_key_pair" "bastion" {
  key_name   = "bastion"
  public_key = file("~/.ssh/id_rsa.pub")
}