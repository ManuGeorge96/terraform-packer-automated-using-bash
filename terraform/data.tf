data "aws_ami" "AMI" {
  owners = ["self"]
  filter {
    name = "name"
    values = [ "${var.PROJECT}-AMI-*" ]
  }
  filter {
  name = "root-device-type"
  values = ["ebs"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  most_recent = true
}
