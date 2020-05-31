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

resource "aws_route" "public_internet_gateway" {
  route_table_id = aws_route_table.rt.id #from the table below
  instance_id = aws_instance.bastion-host.id
  destination_cidr_block = "0.0.0.0/0"
  timeouts {
    create = "5m"
  }
}
  
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.core-infra.id
  
  route {
    cidr_block = "172.31.0.0/16"
    gateway_id = aws_internet_gateway.gw.id
  }
 }
 
