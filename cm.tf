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

/* resource "aws_iam_role" "lbc_iam_role" {
  name = "AWSEKSLoadBalancerControllerRole"
  description = "AWS Load Balancer Controller IAM policy"
  assume_role_policy = jsonencode({
    "version": "2012-10-17"
    "statement": [
      {
        "Effect" = "Allow",
        "principal": {
          "Federated": "arn:aws:iam::${data.aws_caller_identity.current.id}:oidc-provider/oidc.eks.ap-south-1.amazonaws.com/id/A1B9099EA5B93672CC683D799A83E679"
        }
        "Action" = "sts:AssumeRoleWithWebIdentity",
        "conditions": {
          "StringEquals": {
            "oidc.eks.ap-south-1.amazonaws.com/id/A1B9099EA5B93672CC683D799A83E679:sub" : "system:serviceaccount:kube-system:aws-load-balancer-controller",
            "oidc.eks.ap-south-1.amazonaws.com/id/A1B9099EA5B93672CC683D799A83E679:aud" : "sts.amazonaws.com"
            
          }
        }
         
      }

    ]
  })
  tags = {
    tag-key = "AWSLoadBalancerControllerIAMPolicy"
  }
} */
