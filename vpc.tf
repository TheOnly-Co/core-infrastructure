resource "aws_vpc" "core-infra" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "dedicated"
  tags = {
    Name = "core-infra"
 }
}       
resource "aws_subnet" "core-infra" {
  vpc_id = aws_vpc.core-infra.id
  cidr_block = "10.0.0.0/24"
}
