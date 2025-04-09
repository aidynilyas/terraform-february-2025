resource "aws_key_pair" "deployer" {
  key_name   = var.aws_key
    public_key = file("~/.ssh/id_rsa.pub")

    tags = local.common_tags
}