resource "aws_vpc" "core-infra" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "dedicated"
  tags = {
    Name = "core-infra"
  }
}       
resource "aws_subnet" "core-infra-a" {
  vpc_id = aws_vpc.core-infra.id
  availability_zone = "us-west-2a"
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "core-infra-b" {
  vpc_id = aws_vpc.core-infra.id
  availability_zone = "us-west-2b"
  cidr_block = "10.0.0.1/24"
}

resource "aws_subnet" "core-infra-c" {
  vpc_id = aws_vpc.core-infra.id
  availability_zone = "us-west-2c"
  cidr_block = "10.0.0.2/24"
}

resource "aws_internet_gateway" "gw"{
  vpc_id = aws_vpc.core-infra.id
}

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.core-infra.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
 }
 
resource "aws_route_table_association" "associations-a" {
    route_table_id = aws_route_table.route-table.id
    subnet_id = aws_subnet.core-infra-a.id
}
resource "aws_route_table_association" "associations-b" {
    route_table_id = aws_route_table.route-table.id
    subnet_id = aws_subnet.core-infra-b.id
}
resource "aws_route_table_association" "associations-c" {
    route_table_id = aws_route_table.route-table.id
    subnet_id = aws_subnet.core-infra-c.id
}
