output "identity"  { 
  value = module.myeks.identity
}


output "lbc_iam_policy" {
  value = data.http.lbc_iam_policy.body
}
