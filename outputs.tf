output "aws_iam_access_key_secret" {
  description = "AWS IAM Access Key Secret"
  value       = { for access_key in aws_iam_access_key.user_access_keys : access_key.user => access_key.secret }
}

output "aws_iam_user_password" {
  description = "AWS IAM User Password"
  value       = { for login_profile in aws_iam_user_login_profile.user_login_profiles : login_profile.user => login_profile.password }
}

output "aws_iam_user_key_fingerprint" {
  description = "AWS IAM User Key Fingerprint"
  value       = { for login_profile in aws_iam_user_login_profile.user_login_profiles : login_profile.user => login_profile.key_fingerprint }
}

output "aws_iam_user_ssh_key_fingerprint" {
  description = "AWS IAM User SSH Key Fingerprint"
  value       = { for ssh_key in aws_iam_user_ssh_key.user_ssh_keys : ssh_key.username => ssh_key.fingerprint }
}

output "aws_iam_user_ssh_key_public_key" {
  description = "AWS IAM User SSH Key Public Key"
  value       = { for ssh_key in aws_iam_user_ssh_key.user_ssh_keys : ssh_key.username => ssh_key.public_key }
}