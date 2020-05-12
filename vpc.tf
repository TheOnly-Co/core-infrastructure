resource "aws_vpc" "core-infra" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags = {
    Name = "core-infra"
 }
}
