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
          instance_type = "t3.micro"
          asg_max_size = 1
        }
    
    ]
}
variable devops_admin_arn {
    description = "The arn of the devops admin access account"
}

resource "aws_eks_node_group" "elastic" {
    cluster_name = "core-infra-eks"
    node_group_name = "elastic"
    node_role_arn = "arn:aws:iam::216228501626:role/core-infra-eks20200616045837471300000001" 
    subnet_ids = module.vpc-west.public_subnets

    scaling_config {
        desired_size = 4
        max_size = 5 
        min_size = 1 
    }
}
