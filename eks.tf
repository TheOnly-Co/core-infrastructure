data "aws_eks_cluster" "cluster" {
    name = module.core-infra-eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
    name = module.core-infra-eks.cluster_id
}

module "core-infra-eks" {
    source = "git::https://github.com/terraform-aws-modules/terraform-aws-eks" 
    cluster_name = "core-infra-eks"
    cluster_version = "1.16"
    subnets = module.vpc-west.public_subnets 
    vpc_id = module.vpc-west.vpc_id
    map_roles = [
        {
            rolearn = var.devops_admin_arn
            username = "devops-admin"
            groups = ["system:masters"]
        },
        {
            rolearn = module.core-infra-eks.worker_iam_role_arn
            username = "system:node:{{EC2PrivateDNSName}}"
            groups = ["system:nodes","system:bootstrappers"]
        }
    ]
    worker_groups = [
        {
          name = "eks-spot"
          spot_price = "0.0104"
          instace_type = "t3.micro"
          asg_max_size = 1
          kubelet_extra_args  = "--node-labels=node.kubernetes.io/lifecycle=spot"
          suspended_processes = ["AZRebalance"]
        }
    
    ]
}
variable devops_admin_arn {
    description = "The arn of the devops admin access account"
}
