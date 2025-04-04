resource "aws_key_pair" "bastion" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_s3_bucket" "example" {
  bucket = "kaizen-aidyni"
}

resource "aws_s3_object" "object" {
  depends_on = [aws_s3_bucket.example]
  #bucket = aws_s3_bucket.example.bucket
  bucket = "kaizen-aidyni"
  key    = "provider.tf"
  source = "provider.tf"
}