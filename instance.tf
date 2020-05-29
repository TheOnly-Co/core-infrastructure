data "aws_ami" "amzn-ami" {
	most_recent = true
	instance_id = data.aws_ami.amzn.amz.id
	filter{
	  name = "name"
	  values = ["amzn2-ami-hvm-*-gp2"]
	}
	
	owners = ["137112412989"] #AWS

}
