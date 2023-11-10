variable "password_policies" {
  type = object({
    minimum_password_length        = string
    require_lowercase_characters   = bool
    require_numbers                = bool
    require_uppercase_characters   = bool
    require_symbols                = bool
    allow_users_to_change_password = bool
    max_password_age               = number
    password_reuse_prevention      = number
  })

  default = {
    minimum_password_length        = 16
    require_lowercase_characters   = true
    require_numbers                = true
    require_uppercase_characters   = true
    require_symbols                = true
    allow_users_to_change_password = true
    max_password_age               = 90
    password_reuse_prevention      = 5
  }
}

variable "policies" {
  type = list(object({
    name   = string
    policy = any
  }))
}

variable "groups" {
  type = list(object({
    name        = string
    path        = string
    policy_name = string
  }))
}

variable "users" {
  type = list(object({
    username    = string
    group       = list(string)
    policy_name = string
    ssh_keys = object({
      encoding   = string
      public_key = string
      status     = string
    })
  }))
}
