provider "null" {

}
# Retrieve the IAM policy JSON using a shell command
resource "null_resource" "json_file" {
    provisioner "local-exec" {
        command = "curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json"
    }
}
# Parse the JSON and create the IAM policy
resource "aws_iam_policy" "example_policy" {
  name        = "AWSLoadBalancerControllerIAMPolicy"
  description = "Example IAM policy"

  policy = file("C:/Users/anves/rentzone-infrastructure-ecs/iam_policy.json")
} 


/* resource "aws_eks_iam_service_account" "aws_load_balancer_controller" {
  name                = "aws-load-balancer-controller"
  namespace           = "kube-system"
  cluster_name        = "stademo"
  role_name           = "AmazonEKSLoadBalancerControllerRole"
  attach_policy_arns  = "arn:aws:iam::111122223333:policy/AWSLoadBalancerControllerIAMPolicy"
  approve = true
  # depends_on          = [aws_eks_cluster.stademo]  # Make sure your EKS cluster resource is defined

  # (Optional) You can specify additional tags if needed
  tags = {
    Key = "Value"
  }
} */

