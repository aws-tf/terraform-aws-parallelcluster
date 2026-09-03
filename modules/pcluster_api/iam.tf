/**
 *  # LoginNodes ELB listener creation workaround
 *
 *  The ParallelCluster API CloudFormation template (published from
 *  aws/aws-parallelcluster, cloudformation/policies/parallelcluster-policies.yaml,
 *  Sid `LoginNodesFunctionalities`) grants
 *  `elasticloadbalancing:CreateListener` and `CreateTargetGroup` only under a
 *  `ForAllValues:StringEquals` condition that allow-lists a single request tag
 *  key, `parallelcluster:cluster-name`. ParallelCluster stamps additional tag
 *  keys on the LoginNodes listener / target-group create requests, so that
 *  condition denies the calls and the LoginNodesNestedStack rolls back with:
 *
 *    The following resource(s) failed to create: [...LoginNodesListener...]
 *
 *  `CreateLoadBalancer`/`AddTags` live in a separate unconditional statement
 *  (`LoginNodesFunctionalitiesNoCondition`), which is why the load balancer is
 *  created but the listener is not. The grants are conditional Allows with no
 *  matching Deny, so an unconditional Allow attached to the API Lambda role via
 *  the `ParallelClusterFunctionAdditionalPolicies` template parameter is
 *  additive and lets the create succeed regardless of which tag keys
 *  ParallelCluster applies. The action set is a strict subset of what the
 *  template already grants (just without the tag condition), so this adds no
 *  new capability beyond what LoginNodes clusters already need.
 */

resource "aws_iam_policy" "login_nodes_elb" {
  name_prefix = "pcluster-login-nodes-elb-"
  description = "Allow the ParallelCluster API Lambda to create LoginNodes ELB listeners/target groups regardless of request tag keys (works around the LoginNodesFunctionalities tag condition)."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "LoginNodesListenerCreateRegardlessOfTags"
        Action = [
          "elasticloadbalancing:CreateListener",
          "elasticloadbalancing:CreateTargetGroup",
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

locals {
  # Append our supplemental policy to any ParallelClusterFunctionAdditionalPolicies
  # the caller already passed (the template parameter is a comma-delimited list).
  existing_additional_policies = lookup(var.parameters, "ParallelClusterFunctionAdditionalPolicies", "")

  parameters_with_login_nodes_elb = merge(var.parameters, {
    ParallelClusterFunctionAdditionalPolicies = (
      local.existing_additional_policies == ""
      ? aws_iam_policy.login_nodes_elb.arn
      : "${local.existing_additional_policies},${aws_iam_policy.login_nodes_elb.arn}"
    )
  })
}
