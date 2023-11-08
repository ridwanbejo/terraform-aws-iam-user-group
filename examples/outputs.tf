output "aws_iam_access_key_secret" {
  description = "AWS IAM Access Key Secret"
  value       = module.iam_user_group.aws_iam_access_key_secret
  sensitive   = true
}

output "aws_iam_user_password" {
  description = "AWS IAM User Password"
  value       = module.iam_user_group.aws_iam_user_password
  sensitive   = true
}

output "aws_iam_user_ssh_key_public_key" {
  description = "AWS IAM User SSH Key Public Key"
  value       = module.iam_user_group.aws_iam_user_ssh_key_public_key
}
