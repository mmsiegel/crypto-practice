output "env" {
    value = var.env
}

output "group_name" {
    value = aws_iam_group.ci-group.name
}

output "policy_name" {
    value = aws_iam_policy.ci-policy.name
}

output "policy_description" {
    value = aws_iam_policy.ci-policy.description
}

output "role_name" {
    value = aws_iam_role.ci-role.name
}

output "role_description" {
    value = aws_iam_role.ci-role.description
}
