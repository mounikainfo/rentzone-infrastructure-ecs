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

