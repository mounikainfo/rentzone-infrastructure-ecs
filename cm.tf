provider "null" {

}
# Retrieve the IAM policy JSON using a shell command
resource "null_resource" "json_file" {
    provisioner "local-exec" {
        command = "curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json"
    }
}

# Parse the JSON and create the IAM policy
resource "aws_iam_policy" "lbc_iam_policy" {
  name        = "AWSLoadBalancerControllerIAMPolicy"
  description = "AWS Load Balancer Controller IAM policy"
  policy = file("C:/Users/anves/rentzone-infrastructure-ecs/iam_policy.json")
} 


# data "aws_caller_identity" "current" {}
# aws_eks_cluster.demo.identity[0].oidc[0].issuer

# create iam role

resource "aws_iam_role" "lbc_iam_role" {
  name = "lbc-iam-role"
  description = "AWS Load Balancer Controller IAM policy"
  assume_role_policy = jsonencode({
    "version": "2012-10-17"
    "statement": [
      {
        "Action" = "sts:AssumeRoleWithWebIdentity",
        "Effect" = "Allow",
        "principal": {
          "Federated": "${data.terraform_remote_state.eks.outputs.aws_iam_openid_connect_provider_arn}"
        }
        "conditions": {
          "StringEquals": {
            "${data.terraform_remote_state.eks.outputs.aws_iam_openid_connect_provider_extract_from_arn}:aud" : "sts.amazonaws.com",
            "${data.terraform_remote_state.eks.outputs.aws_iam_openid_connect_provider_extract_from_arn}:sub" : "system:serviceaccount:kube-system:aws-load-balancer-controller"
            
          }
        }
         
      }

    ]
  })
  tags = {
    tag-key = "AWSLoadBalancerControllerIAMPolicy"
  }
}
