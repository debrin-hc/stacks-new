identity_token "aws" {
  audience = [ "aws.workload.identity" ]
}

deployment "development" {
  inputs = {
    bucket_name       = "stacks-cli-poc"
    region            = "ap-south-1"
    identity_token    = identity_token.aws.jwt
    role_arn          = "arn:aws:iam::288761736588:role/hcp-terraform-stacks"
  }
}
