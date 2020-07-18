resource "aws_elasticsearch_domain" "core-infra-eks-logs" {
    domain_name = "core-infra-eks-logs"
    cluster_config {
      instance_type = "t2.small.elasticsearch"
    }
    
}
