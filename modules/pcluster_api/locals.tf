locals {
  s3_uri                = "https://${var.region}-aws-parallelcluster.s3.${var.region}.amazonaws.com"
  s3_bucket             = "parallelcluster"
  s3_path               = "${var.api_version}/api/parallelcluster-api.yaml"
  pcluster_template_uri = "${local.s3_uri}/${local.s3_bucket}/${local.s3_path}"

  use_custom_pcluster_template_uri = var.custom_pcluster_template_uri != ""
}
