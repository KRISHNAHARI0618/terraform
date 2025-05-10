terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.97.0"
    }

  }
  backend "s3" {
    bucket = "${local.name}"
    
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web1" {
  count         = 2
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
}

