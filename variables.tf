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

variable "groups" {
  type = list(object({
    name = string
    path = string
  }))

  default = [
    {
      name = "guests"
      path = "/guests/"
    },
  ]
}

variable "group_policies" {
  type = list(object({
    name   = string
    group  = string
    policy = any
  }))

  default = [
    {
      name  = "guests_policy"
      group = "guests"
      policy = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect = "Allow"
            Action = [
              "ec2:DescribeInstances",
            ]
            Resource = "*"
            "Condition": {
                "Bool": {
                    "aws:MultiFactorAuthPresent": ["true"]
                }
            }
          },
          {
            Effect : "Allow",
            Action : [
              "s3:ListAllMyBuckets"
            ],
            Resource : "*"
            "Condition": {
                "Bool": {
                    "aws:MultiFactorAuthPresent": ["true"]
                }
            }
          }
        ]
      }
    },
  ]
}

variable "users" {
  type = list(object({
    username = string
    group    = list(string)
    ssh_keys = object({
      encoding   = string
      public_key = string
      status     = string
    })
  }))

  default = [
    {
      username = "ridwanbejo",
      group    = ["guests"],
      ssh_keys = {
        encoding   = "SSH",
        public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 ridwanbejo@mydomain.com"
        status     = "active"
      }
    }
  ]
}
