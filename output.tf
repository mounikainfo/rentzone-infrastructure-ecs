output "identity"  { 
  value = module.myeks.identity
}

output "lbc_iam_policy" {
  value = file("C:/Users/anves/rentzone-infrastructure-ecs/iam_policy.json")
}

/* output "lbc_iam_policy_arn" {
  value = aws_iam_policy.lbc_iam_policy.arn
}
 */
output "lbc_iam_role_arn" {
  value = aws_iam_role.lbc_iam_role.arn
}


# Helm Release Outputs
output "lbc_helm_metadata" {
  value       = helm_release.loadbalancer_controller.metadata
}