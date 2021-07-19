#Referenced official TF documentation: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document

locals {
  arn = "arn:aws:iam::123456789012:root"
  name = "ci-users"
}

resource "aws_iam_role" "ci-role" {
  name               = var.role_name
  description        = var.role_description
  assume_role_policy = data.aws_iam_policy_document.json
}

#policy syntax sourced from: https://aws.amazon.com/premiumsupport/knowledge-center/iam-assume-role-cli/
data "aws_iam_policy_document" "aws_iam_ci-policy_doc" {
    statement {
      Effect    = "Allow"
      Principal = { "AWS": "arn:aws:iam::123456789012:root" }
      Action    = "sts:AssumeRole"
    }
}

resource "aws_iam_group_policy_attachment" "policy_attachment" {
  group      = aws_iam_group.ci-group.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_policy" "ci-policy" {
  name        = var.policy_name
  description = var.policy_description
  policy      = data.aws_iam_policy_document.json
}

resource "aws_iam_group" "ci-group"{
  name        = var.group_name
}

resource "aws_iam_user" "ci-user" {
  name        = var.user_name
}

resource "aws_iam_group_membership" "ci-users" {
    name = local.name
    users = [
        "${aws_iam_user.ci-user.name}",
    ]
    group = "${aws_iam_group.ci-group.name}"
}
