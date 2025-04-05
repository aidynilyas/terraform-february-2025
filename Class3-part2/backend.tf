terraform {
  backend "s3" {
    bucket = "kaizen-aidyni"
    key    = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}