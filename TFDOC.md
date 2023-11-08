<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.user_access_keys](https://registry.terraform.io/providers/hashicorp/aws/5.24.0/docs/resources/iam_access_key) | resource |
| [aws_iam_account_password_policy.user_password_strict_rule](https://registry.terraform.io/providers/hashicorp/aws/5.24.0/docs/resources/iam_account_password_policy) | resource |
| [aws_iam_group.user_groups](https://registry.terraform.io/providers/hashicorp/aws/5.24.0/docs/resources/iam_group) | resource |
| [aws_iam_group_policy.user_group_policies](https://registry.terraform.io/providers/hashicorp/aws/5.24.0/docs/resources/iam_group_policy) | resource |
| [aws_iam_user.users](https://registry.terraform.io/providers/hashicorp/aws/5.24.0/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.user_groups](https://registry.terraform.io/providers/hashicorp/aws/5.24.0/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_user_login_profile.user_login_profiles](https://registry.terraform.io/providers/hashicorp/aws/5.24.0/docs/resources/iam_user_login_profile) | resource |
| [aws_iam_user_ssh_key.user_ssh_keys](https://registry.terraform.io/providers/hashicorp/aws/5.24.0/docs/resources/iam_user_ssh_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group_policies"></a> [group\_policies](#input\_group\_policies) | n/a | <pre>list(object({<br>    name   = string<br>    group  = string<br>    policy = any<br>  }))</pre> | <pre>[<br>  {<br>    "group": "guests",<br>    "name": "guests_policy",<br>    "policy": {<br>      "Statement": [<br>        {<br>          "Action": [<br>            "ec2:DescribeInstances"<br>          ],<br>          "Condition": {<br>            "Bool": {<br>              "aws:MultiFactorAuthPresent": [<br>                "true"<br>              ]<br>            }<br>          },<br>          "Effect": "Allow",<br>          "Resource": "*"<br>        },<br>        {<br>          "Action": [<br>            "s3:ListAllMyBuckets"<br>          ],<br>          "Condition": {<br>            "Bool": {<br>              "aws:MultiFactorAuthPresent": [<br>                "true"<br>              ]<br>            }<br>          },<br>          "Effect": "Allow",<br>          "Resource": "*"<br>        }<br>      ],<br>      "Version": "2012-10-17"<br>    }<br>  }<br>]</pre> | no |
| <a name="input_groups"></a> [groups](#input\_groups) | n/a | <pre>list(object({<br>    name = string<br>    path = string<br>  }))</pre> | <pre>[<br>  {<br>    "name": "guests",<br>    "path": "/guests/"<br>  }<br>]</pre> | no |
| <a name="input_password_policies"></a> [password\_policies](#input\_password\_policies) | n/a | <pre>object({<br>    minimum_password_length        = string<br>    require_lowercase_characters   = bool<br>    require_numbers                = bool<br>    require_uppercase_characters   = bool<br>    require_symbols                = bool<br>    allow_users_to_change_password = bool<br>    max_password_age               = number<br>    password_reuse_prevention      = number<br>  })</pre> | <pre>{<br>  "allow_users_to_change_password": true,<br>  "max_password_age": 90,<br>  "minimum_password_length": 16,<br>  "password_reuse_prevention": 5,<br>  "require_lowercase_characters": true,<br>  "require_numbers": true,<br>  "require_symbols": true,<br>  "require_uppercase_characters": true<br>}</pre> | no |
| <a name="input_users"></a> [users](#input\_users) | n/a | <pre>list(object({<br>    username = string<br>    group    = list(string)<br>    ssh_keys = object({<br>      encoding   = string<br>      public_key = string<br>      status     = string<br>    })<br>  }))</pre> | <pre>[<br>  {<br>    "group": [<br>      "guests"<br>    ],<br>    "ssh_keys": {<br>      "encoding": "SSH",<br>      "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 ridwanbejo@mydomain.com",<br>      "status": "active"<br>    },<br>    "username": "ridwanbejo"<br>  }<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_iam_access_key_secret"></a> [aws\_iam\_access\_key\_secret](#output\_aws\_iam\_access\_key\_secret) | AWS IAM Access Key Secret |
| <a name="output_aws_iam_user_key_fingerprint"></a> [aws\_iam\_user\_key\_fingerprint](#output\_aws\_iam\_user\_key\_fingerprint) | AWS IAM User Key Fingerprint |
| <a name="output_aws_iam_user_password"></a> [aws\_iam\_user\_password](#output\_aws\_iam\_user\_password) | AWS IAM User Password |
| <a name="output_aws_iam_user_ssh_key_fingerprint"></a> [aws\_iam\_user\_ssh\_key\_fingerprint](#output\_aws\_iam\_user\_ssh\_key\_fingerprint) | AWS IAM User SSH Key Fingerprint |
| <a name="output_aws_iam_user_ssh_key_public_key"></a> [aws\_iam\_user\_ssh\_key\_public\_key](#output\_aws\_iam\_user\_ssh\_key\_public\_key) | AWS IAM User SSH Key Public Key |
<!-- END_TF_DOCS -->
