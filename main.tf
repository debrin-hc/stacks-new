data "tls_certificate" "provider" {
  url = "https://app.terraform.io"
}

resource "aws_iam_openid_connect_provider" "hcp_terraform" {
  url = "https://app.terraform.io"

  client_id_list = [
    "aws.workload.identity",
  ]

  thumbprint_list = [
    data.tls_certificate.provider.certificates[0].sha1_fingerprint,
  ]
}

locals {
  sub = [for deployment in var.deployment_names : join(":", [
    "organization",
    var.organization_name,
    "project",
    var.project_name,
    "stack",
    var.stack_name,
    "deployment",
    deployment,
    "operation",
    "*"
  ])]
}

data "aws_iam_policy_document" "oidc_assume_role_policy" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.hcp_terraform.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "app.terraform.io:aud"
      values   = ["aws.workload.identity"]
    }

    condition {
      test     = "StringLike"
      variable = "app.terraform.io:sub"
      values   = local.sub
    }
  }
}

data "aws_iam_policy" "administrator_access" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "administrator_access" {
  policy_arn = data.aws_iam_policy.administrator_access.arn
  role       = aws_iam_role.hcp_terraform_stacks.name
}

resource "aws_iam_role" "hcp_terraform_stacks" {
  name               = "hcp-terraform-stacks"
  assume_role_policy = data.aws_iam_policy_document.oidc_assume_role_policy.json
}

