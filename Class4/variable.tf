variable aws_key{
    default = "hello-key"
    type = string
}

variable region {
    default = "us-east-2"
    type = string
}

variable port{
    default = [22, 80]
    type = list(number)
}

variable ec2{
    type = object({
        ami = string
        type = string
        tags = map
    })
    default = ({
        ami = "amzn2-ami-hvm-*-x86_64-gp2"
        type = "t2.micro"

        tags = {
        Environment = var.region-dev
        Team = "DevOps"
        Project = "Kaizen"
    }
    })
}