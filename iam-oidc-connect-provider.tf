data "aws_partition" "current" {}

resource "aws_iam_openid_connect_provider" "oidc_provider" {
  client_id_list = ["sts.${data.aws_partition.current.dns_suffix}"]
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
  url = oidc.eks.ap-south-1.amazonaws.com/id/A1B9099EA5B93672CC683D799A83E679
}