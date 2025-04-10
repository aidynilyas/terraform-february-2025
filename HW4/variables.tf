variable "forVpc" {
  type = object({
    cidr_block        = string
    enable_dns_hostnames = bool
    enable_dns_support   = bool
  })
  default = {
      cidr_block           = "10.0.0.0/16"
      enable_dns_hostnames = true
      enable_dns_support   = false
    }
}

variable "subnets" {
  type = list(object({
    cidr_block           = string
    availability_zone    = string
    auto_assign_public_ip = bool
    name                 = string
  }))
  default = [
    {
      cidr_block            = "10.0.1.0/24"
      availability_zone     = "us-east-1a"
      auto_assign_public_ip = true
    },
    {
      cidr_block            = "10.0.2.0/24"
      availability_zone     = "us-east-1b"
      auto_assign_public_ip = true
    },
    {
      cidr_block            = "10.0.3.0/24"
      availability_zone     = "us-east-1a"
      auto_assign_public_ip = false
    },
    {
      cidr_block            = "10.0.4.0/24"
      availability_zone     = "us-east-1b"
      auto_assign_public_ip = false
    }
  ]
}

variable "forIgw" {
  type        = string
  default     = "igw"
}

variable "forRt" {
  type        = list(string)
  default     = ["public-rt", "private-rt"]
}

variable "ports" {
  type        = list(number)
  default     = [22, 80, 443, 3306]
}

variable "forEc2" {
  type = object({
    ami_id        = string
    instance_type = string
  })
  default = {
    ami_id        = "ami-00a929b66ed6e0de6"
    instance_type = "t2.micro"
  }
}
