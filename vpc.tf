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

resource "aws_internet_gateway" "gw"{
  vpc_id = aws_vpc.core-infra.id
}

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.core-infra.id
  
  route {
    cidr_block = "10.0.0.0/24"
    gateway_id = aws_internet_gateway.gw.id
  }
 }
 
