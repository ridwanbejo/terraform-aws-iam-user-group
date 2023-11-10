# Terraform AWS IAM User Group

This is a Terraform module for managing IAM Users and Groups at AWS. You can use this module both for commercial or non-commercial purposes.

Currently, you can manage these resources by using this module:

- IAM Account Password Policy
- IAM Group
- IAM Group Policy Attachment
- IAM User
- IAM User Group Membership
- IAM User Policy Attachment
- IAM User SSH Key
- IAM User Access Key
- IAM User Login Profile

Tested in:

- Localstack ✅
- AWS ❌

## A. Prerequisites

Requirements:

- Terraform with version >= 1.4
- Hashicorp/AWS Provider
- AWS Secret and Access Key

## B. How to use this module for your Terraform project ?

- Copy `example` project from this module. You can extend it as per your requirements
- Configure AWS Secret and Access Key by modifying the `providers.tf`
  - Ensure that you store the AWS Secret and Access Key in environment variables. Don't put it in the terraform file
- Create `terraform.tfvars` inside the Project. Then copy this sample terraform.tfvars into the file:

```
iam_policies =  [
  {
    name  = "guests_policy"
    policy = {
      Version = "2012-10-17"
      Statement = [
        {
          Effect : "Allow",
          Action : [
            "s3:ListAllMyBuckets"
          ],
          Resource : "*"
          Condition = {
            Bool = {
              "aws:MultiFactorAuthPresent" = ["true"]
            }
          }
        }
      ]
    }
  },
  {
    name  = "developers_policy"
    policy = {
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action = [
            "ec2:Describe*",
          ]
          Resource = "*"
          Condition = {
            Bool = {
              "aws:MultiFactorAuthPresent" = ["true"]
            }
          }
        },
        {
          Effect : "Allow",
          Action : [
            "s3:ListAllMyBuckets"
          ],
          Resource : "*"
          Condition = {
            Bool = {
              "aws:MultiFactorAuthPresent" = ["true"]
            }
          }
        }
      ]
    }
  },
  {
    name  = "vendor_policy"
    policy = {
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action = [
            "ec2:Describe*",
          ]
          Resource = "*"
          Condition = {
            Bool = {
              "aws:MultiFactorAuthPresent" = ["true"]
            }
          }
        }
      ]
    }
  },
]

iam_groups = [
  {
    name        = "developers"
    path        = "/developers/"
    policy_name = "developers_policy"
  },
  {
    name = "guests"
    path = "/guests/"
    policy_name = "guests_policy"
  },
]

iam_users = [
  {
    username = "ridwanbejo",
    group    = ["developers"],
    policy_name = ""
    ssh_keys = {
      encoding   = "SSH",
      public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 ridwanbejo@mydomain.com"
      status     = "active"
    }
  },
  {
    username = "amaris",
    group    = ["developers"],
    policy_name = ""
    ssh_keys = {
      encoding   = "SSH",
      public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK42 amaris@mydomain.com"
      status     = "active"
    }
  },
  {
    username = "satrio",
    group    = ["developers"],
    policy_name = ""
    ssh_keys = {
      encoding   = "SSH",
      public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK43 satrio@mydomain.com"
      status     = "active"
    }
  },
  {
    username = "mega",
    group    = ["developers"],
    policy_name = ""
    ssh_keys = {
      encoding   = "SSH",
      public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK44 mega@mydomain.com"
      status     = "active"
    }
  },
  {
    username = "rasuna",
    group    = ["guests"],
    policy_name = ""
    ssh_keys = {
      encoding   = "",
      public_key = ""
      status     = ""
    }
  },
  {
    username = "said",
    group    = ["guests"],
    policy_name = ""
    ssh_keys = {
      encoding   = "",
      public_key = ""
      status     = ""
    }
  },
  {
    username = "gatot",
    group    = [],
    policy_name = ""
    ssh_keys = {
      encoding   = "",
      public_key = ""
      status     = ""
    }
  },
  {
    username    = "subroto",
    group       = [],
    policy_name = "vendor_policy"
    ssh_keys = {
      encoding   = "",
      public_key = ""
      status     = ""
    }
  }
]
 ```

- Adjust the change based on your requirements. The tfvars above is just example. Then, Save it
- Run these commands:

```
$ terraform init
$ terraform plan
$ terraform apply -auto-approve
```

- If it succeed, you must see this kind of output on your terminal

```
...

module.iam_user_group.aws_iam_user_ssh_key.user_ssh_keys["mega"]: Creation complete after 0s [id=APKAPGY467FTE8Z5QS71]
module.iam_user_group.aws_iam_user_group_membership.user_groups["rasuna"]: Creating...
module.iam_user_group.aws_iam_user_login_profile.user_login_profiles["satrio"]: Creating...
module.iam_user_group.aws_iam_user_ssh_key.user_ssh_keys["ridwanbejo"]: Creation complete after 0s [id=APKAJ8MXUJVZH4H2STFF]
module.iam_user_group.aws_iam_access_key.user_access_keys["ridwanbejo"]: Creation complete after 0s [id=LKIAQAAAAAAALG7PIISD]
module.iam_user_group.aws_iam_access_key.user_access_keys["said"]: Creation complete after 0s [id=LKIAQAAAAAAANHIZFP36]
module.iam_user_group.aws_iam_user_login_profile.user_login_profiles["mega"]: Creation complete after 0s [id=mega]
module.iam_user_group.aws_iam_user_login_profile.user_login_profiles["gatot"]: Creating...
module.iam_user_group.aws_iam_user_ssh_key.user_ssh_keys["satrio"]: Creation complete after 0s [id=APKAHBF8QHBAHC48FXND]
module.iam_user_group.aws_iam_access_key.user_access_keys["amaris"]: Creation complete after 0s [id=LKIAQAAAAAAAEC6R6RTU]
module.iam_user_group.aws_iam_user_group_membership.user_groups["said"]: Creating...
module.iam_user_group.aws_iam_user_login_profile.user_login_profiles["amaris"]: Creating...
module.iam_user_group.aws_iam_user_group_membership.user_groups["amaris"]: Creating...
module.iam_user_group.aws_iam_access_key.user_access_keys["rasuna"]: Creating...
module.iam_user_group.aws_iam_user_login_profile.user_login_profiles["gatot"]: Creation complete after 0s [id=gatot]
module.iam_user_group.aws_iam_user_login_profile.user_login_profiles["satrio"]: Creation complete after 0s [id=satrio]
module.iam_user_group.aws_iam_user_group_membership.user_groups["rasuna"]: Creation complete after 0s [id=terraform-20231110014444181600000004]
module.iam_user_group.aws_iam_user_login_profile.user_login_profiles["ridwanbejo"]: Creating...
module.iam_user_group.aws_iam_user_group_membership.user_groups["said"]: Creation complete after 0s [id=terraform-20231110014444261500000005]
module.iam_user_group.aws_iam_user_login_profile.user_login_profiles["amaris"]: Creation complete after 0s [id=amaris]
module.iam_user_group.aws_iam_user_login_profile.user_login_profiles["ridwanbejo"]: Creation complete after 0s [id=ridwanbejo]
module.iam_user_group.aws_iam_user_group_membership.user_groups["amaris"]: Creation complete after 0s [id=terraform-20231110014444287900000006]
module.iam_user_group.aws_iam_access_key.user_access_keys["rasuna"]: Creation complete after 0s [id=LKIAQAAAAAAALR7PF42H]

Apply complete! Resources: 31 added, 0 changed, 0 destroyed.

Outputs:

aws_iam_access_key_secret = <sensitive>
aws_iam_user_password = <sensitive>
aws_iam_user_ssh_key_public_key = {
  "amaris" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK42 amaris@mydomain.com"
  "mega" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK44 mega@mydomain.com"
  "ridwanbejo" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 ridwanbejo@mydomain.com"
  "satrio" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK43 satrio@mydomain.com"
}
```

## C. Understanding tfvars scenarios

There are some scenarios that you could choose by using this module. For example:

1. create user without specifying group and policy

```
iam_users = [
  {
    username    = "gatot",
    group       = [],
    policy_name = ""
    ssh_keys = {
      encoding   = "",
      public_key = ""
      status     = ""
    }
  },
]
```

2. create user without group but specifying policy. Ensure that you create policy in the first place.

```
iam_users = [
  {
    username    = "subroto",
    group       = [],
    policy_name = "vendor_policy"
    ssh_keys = {
      encoding   = "",
      public_key = ""
      status     = ""
    }
  },
]
```

3. create user without policy and specifying group with attached policy. Ensure that you create policy in the first place and attacht it to the group

```
iam_users = [
  {
    username    = "rasuna",
    group       = ['developers'],
    policy_name = ""
    ssh_keys = {
      encoding   = "",
      public_key = ""
      status     = ""
    }
  },
]
```

4. Same with 3rd scenario, but you add ssh_keys for the user

```
iam_users = [
  {
    username    = "satrio",
    group       = ["developers"],
    policy_name = ""
    ssh_keys = {
      encoding   = "SSH",
      public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK43 satrio@mydomain.com"
      status     = "active"
    }
  },
]
```

## D. Ensuring quality

I am trying to follow these approaches for ensuring quality of the tf-module:

- **validate**, ensure my Terraform module is in correct configuration based on Terraform guideline
- **auto-format**, ensure my Terraform script is edited with correct format based on Terraform guideline
- **linter**, ensure my Terraform script is in correct format based on Terraform guideline
- **tests**, ensure my Terraform module is processing correct variables and yield expected outputs
- **security**, ensure my Terraform module is free from CVE and stay compliance
- **automation**, run all above steps by using automation tool to improve development time and keep best quality before or after merging to Git repository


The tools:

- [terraform validate](https://developer.hashicorp.com/terraform/cli/commands)
- [terraform fmt](https://developer.hashicorp.com/terraform/cli/commands)
- [tflint](https://github.com/terraform-lint48ers/tflint)
- [terraform tests](https://developer.hashicorp.com/terraform/language/tests)
- [tfsec](https://github.com/aquasecurity/tfsec)
- [Pre-commit](https://pre-commit.com/)
- Github Action [Setup Terraform pipeline](https://github.com/hashicorp/setup-terraform)

## E. How to contribute ?

If you find any issue, you can raise it here at our [Issue Tracker](https://github.com/ridwanbejo/terraform-aws-iam-user-group/issues)

If you have something that you want to merge to this repo, just raise [Pull Requests](https://github.com/ridwanbejo/terraform-aws-iam-user-group/pulls)

Ensure that you install all the tools from section C for development purpose.
