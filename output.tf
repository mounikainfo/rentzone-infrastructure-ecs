output "identity"  { 
  value = module.myeks.identity
}

output "aws_iam_openid_connect_provider" {
  value = module.myeks.aws_iam_openid_connect_provider
}