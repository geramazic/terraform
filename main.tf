#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-1a85e442
#
# Your security group ID is:
#
#     sg-4dab302b
#
# Your AMI ID is:
#
#     ami-65b69116
#
# Your Identity is:
#
#     test-training-anaconda
#

variable aws_access_key {}

variable aws_secret_key {}

variable aws_region {
  default = "eu-west-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  ami                    = "ami-65b69116"
  count                  = 2
  instance_type          = "t2.micro"
  subnet_id              = "subnet-1a85e442"
  vpc_security_group_ids = ["sg-4dab302b"]

  tags {
    Identity = "test-training-anaconda"
    Name     = "pietjepuk2"
  }

  lifecycle {
    create_before_destroy = true
  }
}

output "public_ip" {
  value = ["${aws_instance.web.*.public_ip}"]
}

output "public_dns" {
  value = ["${aws_instance.web.*.public_dns}"]
}
