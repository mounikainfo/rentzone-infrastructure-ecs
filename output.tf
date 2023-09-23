output "identity"  { 
  value = module.myeks.identity
}

output "lbc_iam_policy" {
  value = file("C:/Users/anves/rentzone-infrastructure-ecs/iam_policy.json")
}

output "lbc_iam_policy_arn" {
  value = aws_iam_policy.lbc_iam_policy.arn
}
