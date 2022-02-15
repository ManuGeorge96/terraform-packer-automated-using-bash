#Egress-Rules for EC2 - Instance
resource "aws_security_group" "Inst-SG" {
  name = "${var.PROJECT}-SG"
  description = "Site-acces"
  egress {
    description = ""
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }
  tags = {
    Name = "${var.PROJECT}-Instance-SG"
  }
}

resource "aws_key_pair" "Key" {
	key_name = var.KEY
	public_key = file("../${var.KEY}.pub")
}

#Resource block to add all specified ingress ports for EC2 Instance

resource "aws_security_group_rule" "Inst-SG" {
  for_each = toset(var.IPORT)
  type = "ingress"
  from_port = each.value
  to_port = each.value
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  ipv6_cidr_blocks = [ "::/0" ]
  security_group_id = aws_security_group.Inst-SG.id
}

resource "aws_instance" "Instance" {
  ami = data.aws_ami.AMI.id
  instance_type = var.TYPE
  key_name = var.KEY
  vpc_security_group_ids = [ aws_security_group.Inst-SG.id ]
  tags = {
    Name = "${var.PROJECT}-SERVER"
    Project = "${var.PROJECT}"
  }
}
