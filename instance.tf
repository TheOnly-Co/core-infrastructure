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
	  description = "TLS from VPC"
	  from_port = 22
	  to_port = 22
	  protocol = "ssh"
	}

	egress {
	  from_port = 0
	  to_port = 0
	  protocol = "-1"
	  cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "web" {
        ami = data.aws_ami.amzn-ami.id
        instance_type = "t3.medium"
	security_groups = [aws_security_group.allow_ssh.id]
	subnet_id = aws_subnet.core-infra.id
}

resource "aws_key_pair" "deployer" {
	key_name = "deployer-key"
        public_key = var.authorized_key
}

variable authorized_key {
	description = "The public ssh rsa key you generated"
}
