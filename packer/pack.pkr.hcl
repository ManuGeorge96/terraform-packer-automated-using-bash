variable "project" {
  default = env("TF_VAR_PROJECT")
}
variable "path" {
  default = env("TF_VAR_PATH")
}
variable "access" {
  default = env("TF_VAR_ACCESS")
}
variable "secret" {
  default = env("TF_VAR_SECRET")
}
variable "region" {
  default = env("TF_VAR_REGION")
}
variable "type" {
  default = env("TF_VAR_TYPE")
}
variable "img" {
  default = env("TF_VAR_IMG")
}
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "packer"{
  ami_name      = "${var.project}-AMI-${local.timestamp}"
  instance_type = var.type
  region        = var.region
  source_ami_filter {
    filters = {
      name                = var.img
      virtualization-type = "hvm"
      root-device-type    = "ebs"
    }
    owners      = ["amazon", "099720109477" ]
    most_recent = true
  }
  access_key   = var.access
  secret_key   = var.secret
  ssh_username = "ec2-user"
  tags = {
    Project  = "${var.project}"
    Name = "${var.project}-AMI-${local.timestamp}"
  }
}

build {
  sources = ["source.amazon-ebs.packer"]
  provisioner "file" {
    source      = var.path
    destination = "~/script.sh"
  }
  provisioner "shell" {
    inline = ["sudo bash ~/script.sh"]
  }
}
