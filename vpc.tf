module "vpc-west" {
    source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=v2.38.0"
    name = "vpc-west"
    cidr = "10.0.0.0/16"
   # azs  = ["us-west-2a", "us-west-2b", "us-west-2c"]

    # private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    # public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

    # enable_nat_gateway = true
    # enable_vpn_gateway = true

    tags = {
        Terraform = "true"
        Environment = "infra"
    }
}
