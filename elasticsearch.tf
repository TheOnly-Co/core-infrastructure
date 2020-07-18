module "core-infra-es" {
  source = "git::https://github.com/cloudposse/terraform-aws-elasticsearch.git?ref=master"
  name = "core-infra-es"
  vpc_id = module.vpc-west.vpc_id
  subnet_ids = module.vpc-west.public_subnets
}



# resource "aws_elasticsearch_domain" "core-infra-eks-logs" {
#     domain_name = "core-infra-eks-logs"
#     cluster_config {
#       instance_type = "t2.small.elasticsearch"
#     }
#     
# }
