module "iam_user_group" {
  source = "../"

  groups         = local.groups
  group_policies = local.group_policies
  users          = local.users
}
