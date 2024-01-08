/**
 *  # API Submodule
 *  The ParallelCluster API submodule deploys an Amazon API Gateway endpoint, IAM roles and policies,
 *  and an AWS Lambda function, that takes care of processing the invoked features.
 *  Deployed using a ParallelCluster API Cloudformation Template.
 */

resource "aws_cloudformation_stack" "parallelcluster" {
  name               = var.name
  template_url       = local.use_custom_pcluster_template_uri ? var.custom_pcluster_template_uri : local.pcluster_template_uri
  timeout_in_minutes = 10
  capabilities       = ["CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]
  parameters         = var.parameters
}
