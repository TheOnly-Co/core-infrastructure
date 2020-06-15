#data "aws_eks_cluster" "cluster" {
 #   name = module.core-infra-cluster.cluster_id
#}

#data "aws_eks_cluster_auth" "cluster" {
 #   name = module.core-infra-cluster.cluster_id
#}

#provider "kubernetes" {
 #   host = data.aws_eks_cluster.cluster.endpoint
  #  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
 #   token = data.aws_eks_cluster_auth.cluster.token
 #   load_config_file = false
 #   version = "~> 1.9"
#}

#module "core-infra-cluster" {
 #   source = "terraform-aws-module/eks/aws"
 #   cluster_name = "core-infra-cluster"
    
#}
