resource "aws_elasticsearch_domain" "core-infra_eks_logs" {
    domain_name = "core-infra_eks_logs"
    cluster_config {
      instance_type = "t2.small.elasticsearch"
    }
    
}
