identity_token "aws" {
  audience = [ "aws.workload.identity" ]
}

locals {
  aws_region = "eu-west-1"
  role_arn   = "arn:aws:iam::<your aws account id>:role/hcp-terraform-stacks"
}

deployment "development" {
  inputs = {
    region         = local.aws_region
    name_suffix    = "development"
    identity_token = identity_token.aws.jwt
    role_arn       = local.role_arn
  }
}

deployment "staging" {
  inputs = {
    region         = local.aws_region
    name_suffix    = "development"
    identity_token = identity_token.aws.jwt
    role_arn       = local.role_arn
  }
}

orchestrate "auto_approve" "successful_plan" {
  check {
    condition = context.plan.applyable
    reason    = "A plan operation failed"
  }
}

