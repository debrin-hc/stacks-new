identity_token "aws" {
  audience = [ "aws.workload.identity" ]
}

locals {
  aws_region = "ap-south-1"
  role_arn   = "arn:aws:iam::288761736588:role/hcp-terraform-stacks"
}

deployment "development" {
  inputs = {
    region         = local.aws_region
    name_suffix    = "development"
    identity_token = identity_token.aws.jwt
    role_arn       = local.role_arn
  }
}
