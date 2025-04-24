required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "5.90.1"
  }
}

provider "aws" "this" {
  config {
    region = "ap-south-1"
    
    assume_role_with_web_identity {
      role_arn           = "arn:aws:iam::288761736588:role/hcp-terraform-stacks"
      web_identity_token = var.identity_token
    }
  }
}

