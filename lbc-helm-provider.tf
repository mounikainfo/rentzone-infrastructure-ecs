# Datasource: EKS Cluster Auth 
data "aws_eks_cluster_auth" "cluster" {
  name = "arn:aws:iam::301167228985:oidc-provider/oidc.eks.ap-south-1.amazonaws.com/id/387078837CC1C38F22758F2FD1467BC6"
}

/* # HELM Provider
provider "helm" {
  kubernetes {
    host                   = "https://387078837CC1C38F22758F2FD1467BC6.gr7.ap-south-1.eks.amazonaws.com"
    cluster_ca_certificate = "base64decode(arn:aws:iam::301167228985:oidc-provider/oidc.eks.ap-south-1.amazonaws.com/id/387078837CC1C38F22758F2FD1467BC6)"
    token                  = data.aws_eks_cluster_auth.cluster.token

  }
}
 */



