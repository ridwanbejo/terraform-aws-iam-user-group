locals {
  users_with_ssh_key = [
    for item in var.users :
    item
    if item.ssh_keys.public_key != ""
  ]
}
