##################################
# CAREFUL EDITING THIS CONFIGMAP #
##################################

locals {
  config_map_aws_auth_west = <<CONFIGMAPAWSAUTH
- rolearn: ${module.api-west-cluster.worker_node_role_arn}
  username: system:node:{{EC2PrivateDNSName}}
  groups:
    - system:bootstrappers
    - system:nodes
- rolearn: var.devops_admin_arn
  username: devops-admin
  groups:
    - system:masters
CONFIGMAPAWSAUTH
}

variable devops_admin_arn {
    description = "The arn of the devops admin access account"
}
