variable "iam_user_groups" {
  type    = list(any)
  default = []
}

variable "iam_user_group_policies" {
  type    = list(any)
  default = []
}

variable "iam_users" {
  type    = list(any)
  default = []
}