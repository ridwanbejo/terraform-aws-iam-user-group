locals {
  users_with_ssh_key = [
    for item in var.users :
    item
    if item.ssh_keys.public_key != ""
  ]

  users_with_policies = [
    for item in var.users :
    item
    if item.policy_name != ""
  ]

  users_with_groups = [
    for item in var.users :
    item
    if length(item.group) > 0
  ]
}
