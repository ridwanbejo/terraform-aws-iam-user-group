resource "aws_iam_account_password_policy" "user_password_strict_rule" {
  minimum_password_length        = var.password_policies.minimum_password_length
  require_lowercase_characters   = var.password_policies.require_lowercase_characters
  require_numbers                = var.password_policies.require_numbers
  require_uppercase_characters   = var.password_policies.require_uppercase_characters
  require_symbols                = var.password_policies.require_symbols
  allow_users_to_change_password = var.password_policies.allow_users_to_change_password
  max_password_age               = var.password_policies.max_password_age
  password_reuse_prevention      = var.password_policies.password_reuse_prevention
}

resource "aws_iam_policy" "policies" {
  for_each = { for idx, item in var.policies : item.name => item }

  name   = each.value.name
  policy = jsonencode(each.value.policy)
}

resource "aws_iam_group" "user_groups" {
  for_each = { for idx, item in var.groups : item.name => item }

  name = each.value.name
  path = each.value.path
}

resource "aws_iam_group_policy_attachment" "user_group_policies" {
  for_each = { for idx, item in var.groups : item.name => item }

  group      = each.value.name
  policy_arn = aws_iam_policy.policies[each.value.policy_name].arn

  depends_on = [aws_iam_group.user_groups, aws_iam_policy.policies]
}

resource "aws_iam_user" "users" {
  for_each = { for idx, item in var.users : item.username => item }

  name = each.value.username
  tags = {
    tag-key = "mycompany-user"
  }

  depends_on = [aws_iam_group.user_groups]
}

resource "aws_iam_user_policy_attachment" "user_policies" {
  for_each = { for idx, item in local.users_with_policies : item.username => item }

  user       = each.value.username
  policy_arn = aws_iam_policy.policies[each.value.policy_name].arn

  depends_on = [aws_iam_user.users, aws_iam_policy.policies]
}

resource "aws_iam_user_group_membership" "user_groups" {
  for_each = { for idx, item in local.users_with_groups : item.username => item }

  user   = aws_iam_user.users[each.value.username].name
  groups = each.value.group

  depends_on = [aws_iam_group.user_groups, aws_iam_user.users]
}

resource "aws_iam_access_key" "user_access_keys" {
  for_each = { for idx, item in var.users : item.username => item }

  user = aws_iam_user.users[each.value.username].name

  depends_on = [aws_iam_user.users]
}

resource "aws_iam_user_login_profile" "user_login_profiles" {
  for_each = { for idx, item in var.users : item.username => item }

  user = aws_iam_user.users[each.value.username].name

  depends_on = [aws_iam_user.users]
}

resource "aws_iam_user_ssh_key" "user_ssh_keys" {
  for_each = { for idx, item in local.users_with_ssh_key : item.username => item }

  username   = aws_iam_user.users[each.value.username].name
  encoding   = each.value.ssh_keys.encoding
  public_key = each.value.ssh_keys.public_key
  status     = each.value.ssh_keys.status

  depends_on = [aws_iam_user.users]
}
