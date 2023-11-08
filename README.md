# Terraform AWS IAM User Group

This is a Terraform module for managing IAM Users and Groups at AWS. You can use this module both for commercial or non-commercial purposes.

Currently, you can manage these resources by using this module:

- IAM Account Password Policy
- IAM Group
- IAM Group Policy
- IAM User
- IAM User Group Membership
- IAM User SSH Key
- IAM User Access Key
- IAM User Login Profile

## A. Prerequisites

Lorem ipsum sit dolor amet.

Example of terraform.tfvars for example usage:

```
iam_user_groups = [
  {
    name = "developers"
    path = "/developers/"
  },
  {
    name = "guests"
    path = "/guests/"
  },
]

iam_user_group_policies = [
  {
    name  = "guests_policy"
    group = "guests"
    policy = {
      Version = "2012-10-17"
      Statement = [
        {
          Effect : "Allow",
          Action : [
            "s3:ListAllMyBuckets"
          ],
          Resource : "*"
        }
      ]
    }
  },
  {
    name  = "developers_policy"
    group = "developers"
    policy = {
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action = [
            "ec2:Describe*",
          ]
          Resource = "*"
        },
        {
          Effect : "Allow",
          Action : [
            "s3:ListAllMyBuckets"
          ],
          Resource : "*"
        }
      ]
    }
  },
]

iam_users = [
  {
    username = "ridwanbejo",
    group    = ["developers"],
    ssh_keys = {
      encoding   = "SSH",
      public_key = "ssh-rsa
AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41
ridwanbejo@mydomain.com"
      status     = "active"
    }
  },
  {
    username = "amaris",
    group    = ["developers"],
    ssh_keys = {
      encoding   = "SSH",
      public_key = "ssh-rsa
AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK42
amaris@mydomain.com"
      status     = "active"
    }
  },
  {
    username = "satrio",
    group    = ["developers"],
    ssh_keys = {
      encoding   = "SSH",
      public_key = "ssh-rsa
AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK43
satrio@mydomain.com"
      status     = "active"
    }
  },
  {
    username = "mega",
    group    = ["developers"],
    ssh_keys = {
      encoding   = "SSH",
      public_key = "ssh-rsa
AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK44
mega@mydomain.com"
      status     = "active"
    }
  },
  {
    username = "rasuna",
    group    = ["guests"],
    ssh_keys = {
      encoding   = "",
      public_key = ""
      status     = ""
    }
  },
  {
    username = "said",
    group    = ["guests"],
    ssh_keys = {
      encoding   = "",
      public_key = ""
      status     = ""
    }
  }
]
 ```

## B. How to use this module ?

Lorem ipsum sit dolor amet.

## C. How to test this module on Localstack ?

Lorem ipsum sit dolor amet.

## D. How to report issue ?

Lorem ipsum sit dolor amet.

## E. How I ensure quality of this module ?

I am trying to follow these approaches for ensuring quality of the tf-module:

- Validate, ensure my Terraform module is in correct configuration based on Terraform guideline
- Linter, ensure my Terraform script is in correct format based on Terraform guideline
- Auto-format, ensure my Terraform script is edited with correct format based on Terraform guideline
- Tests, ensure my Terraform module is processing correct variables and yield expected outputs
- Security, ensure my Terraform module is free from CVE and stay compliance
- Automation, run all above steps by using automation tool to improve development time and keep best quality before or after merging to Git repository

The tools:

- [tflint](https://github.com/terraform-lint48ers/tflint)
- [terraform fmt](https://developer.hashicorp.com/terraform/cli/commands)
- [terraform tests](https://developer.hashicorp.com/terraform/language/tests)
- [tfsec](https://github.com/aquasecurity/tfsec)
- [Pre-commit](https://pre-commit.com/)
- Github Action [Setup Terraform pipeline](https://github.com/hashicorp/setup-terraform)
