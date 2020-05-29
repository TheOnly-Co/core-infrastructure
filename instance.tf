data "aws_ami" "amzn-ami" {
	most_recent = true
	filter{
	  name = "name"
	  values = ["amzn2-ami-hvm-*-gp2"]
	}
	
	owners = ["137112412989"] #AWS
}

resource "aws_security_group" "allow_tls" {
	name = "allow_tls"
	description = "Allow TLS inbound traffic"
        vpc_id = aws_vpc.core-infra.id

	ingress {
	  description = "TLS from VPC"
	  from_port = 80
	  to_port = 22
	  protocol = "tcp"
	}

	egress {
	  from_port = 22
	  to_port = 22
	  protocol = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "web" {
        ami = data.aws_ami.amzn-ami.id
        instance_type = "t3.medium"
	vpc_security_groups = ["sg-046be863ffef4dff7"]
	subnet_id = "subnet-032e1cfe1fd9f3ae0"
}

resource "aws_key_pair" "deployer" {
	key_name = "deployer-key"
        public_key = var.authorized_key
}

variable authorized_key {
	description = "The public ssh rsa key you generated"
}
