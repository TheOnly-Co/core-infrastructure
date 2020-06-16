data "aws_eks_cluster" "cluster" {
    name = module.core-infra-eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
    name = module.core-infra-eks.cluster_id
}

provider "kubernetes" {
    host = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token = data.aws_eks_cluster_auth.cluster.token
    load_config_file = false
}

module "core-infra-eks" {
    source = git::https://github.com/terraform-aws-modules/terraform-aws-eks 
    cluster_name = "core-infra-eks"
    cluster_version = "1.16"
    subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"] 
    vpc_id = module.vpc-west.vpc_id
 
    worker_groups = [
        {
          instace_type = "m3.micro"
          asg_max_size = 5
        }
    
    ]
}

