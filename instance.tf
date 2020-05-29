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

resource "aws_key_pair" "deployer" {
	key_name = "deployer-key"
        public_key = var.authorized_key
        variable authorized_key {
	   description = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDE1/ruN48o6d1/CEshPWx7nqSQmKO+ovwyj3WT/Z+1nMk8CoFaSmyyJm9ZuwcEaPN7uqBg+H6er1nORXF1VpOrA7n5ULsZsG2xyEto/E2C0A/66KrGEA6URKfJpOsQq2iEH/ESha2tokVB7hpwJcRROQnLs87YkrHOUNwoIdozo67cRt6jpEjVj4QWVUj0+nBsPoN5vl/ev5qRFbVQT4a8vFBsuFPshBAqzbTVzQ2AH835wAhTUiT8tDe1XeGBGDD1SNREh5A8l0MR3EAhLbTvn15n2Y9Pqjjk98MMgpLW4UTF0ZrUo6QY475mF7+9ZiXOKMwRhjEa8oIssARepKejpFgzswU1mcdj+PibldNMzT9O6qh1QTD0nUYM5/WoazWcveTydAlRhkhV8LVM/U1gj+3BMCC2LUENtvywedqRbutWTA6TEUdESYMCDXx/m1p6KBGG6p8+xCzmRjcLKc2QZPY0TMkQeY52HkJvZ2j/yK38CqFrzoXnZ23uKP+63p11e33z9XJp1ruxbFiUSmFPsVVYpBtsxqhEvG80FBzdfpQoRD7r+leWKZ/LC376FIv3T+djbWqCvKFTvEEU6kxsFe8zgLefCkAv/y1FX1OWtWA7Hjj6bN7wW+rLIP5ubuyqFA8B04IE4NeYNHaT6EHXNHdlHo4qr6J8avnrj0vPFQ== mitchell.chang11@gmail.com
"	
        }  
}  
