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

resource "aws_iam_role" "lbc_iam_role" {
  name = "AmazonEKSLoadBalancerControllerRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity",
        Effect = "Allow",
        Principal = {
          Federated = "arn:aws:iam::301167228985:oidc-provider/oidc.eks.ap-south-1.amazonaws.com/id/04BDBBF84E9028F8613F98CEF91B89CC"
        },
        Condition = {
          StringEquals = {
            "oidc.eks.ap-south-1.amazonaws.com/id/04BDBBF84E9028F8613F98CEF91B89CC:aud" = "sts.amazonaws.com",
            "oidc.eks.ap-south-1.amazonaws.com/id/04BDBBF84E9028F8613F98CEF91B89CC:sub" = "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      }
    ]
  })
  tags = {
    tag-key = "AWSLoadBalancerControllerIAMPolicy"
  }
}
resource "aws_iam_role_policy_attachment" "lbc_iam_role_policy_attach" {
  policy_arn = aws_iam_policy.lbc_iam_policy.arn
  role       = aws_iam_role.lbc_iam_role.name
}