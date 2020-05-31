data "aws_ami" "amzn-ami" {
    most_recent = true
    filter{
      name = "name"
      values = ["amzn2-ami-hvm-*-gp2"]
    }
    
    owners = ["137112412989"] #AWS
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allow SSH inbound traffic"
    vpc_id = aws_vpc.core-infra.id

    ingress {
      description = "Allow SSH Connection"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "egress-all" {
    name = "egress-all"    
    vpc_id = aws_vpc.core-infra.id

    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
}


resource "aws_key_pair" "infra-master" {
    key_name = "infra-master-key"
    public_key = var.authorized_key
}

resource "aws_instance" "bastion-host" {
    ami = data.aws_ami.amzn-ami.id
    instance_type = "t3.medium"
    security_groups = [aws_security_group.allow_ssh.id, aws_security_group.egress-all.id]
    subnet_id = aws_subnet.core-infra.id
    key_name = aws_key_pair.infra-master.id

}

resource "aws_eip" "bastion-eip"{
    vpc = true
    instance = aws_instance.bastion-host.id

    tags = {
      Assignment = aws_instance.bastion-host.id
      Comment = "Managed by Terraform"
    }
}

variable authorized_key {
    description = "The public ssh rsa key you generated"
}

resource "aws_route" "public_internet_gateway" {
    route_table_id = aws_route_table.core-infra.id #from the table below
    destination_cidr_block = "0.0.0.0/0"
    
    timeouts {
        create = "5m"
    }
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.core-infra.id
    
    route {
        cidr_block = "10.0.0.0/16"
        gateway_id = aws_internet_gateway.core-infra.id
    }
}

