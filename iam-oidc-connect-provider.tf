data "aws_partition" "current" {}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  client_id_list = ["sts.${data.aws_partition.current.dns_suffix}"]
  thumbprint_list = []
  url = aws_eks_cluster.demo.identity[0].oidc[0].issuer
}