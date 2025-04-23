terraform {
  required_version = "~> 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.1"
    }
  }
}

variable "name_suffix" {
  type = string
}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform-stacks-${var.name_suffix}"
  }
}

resource "aws_subnet" "instance" {
  cidr_block = "10.0.10.0/24"
  vpc_id     = aws_vpc.this.id

  tags = {
    Name = "terraform-stacks-instance"
  }
}

output "subnet" {
  value = {
    id = aws_subnet.instance.id
  }
}

