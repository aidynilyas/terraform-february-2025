provider aws {
    region = "us-east-1"
}

module "vpc" {
  source  = "git@github.com:aidynilyas/terraform-aws-vpc.git?ref=v0.1.0"
  
  vpc_cidr = "10.0.0.0/16"
  subnet1_cidr = "10.0.1.0/24"
  #subnet2_cidr = "10.0.2.0/24"
  environment = "dev"
}