module "iam_user_group" {
  source = "../"

  groups   = local.groups
  policies = local.policies
  users    = local.users
}
