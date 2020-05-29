data "aws_ami" "amzn-ami" {
	most_recent = true
	filter{
	  name = "name"
	  values = ["amzn2-ami-hvm-*-gp2"]
	}
	
	owners = ["137112412989"] #AWS

}


resource "aws_instance" "web" {
  	ami = data.aws_ami.amzn-ami.id
 	 instance_type = "t3.medium"
 
}
