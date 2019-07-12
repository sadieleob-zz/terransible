#---Sadielo---

provider "aws" {
region = "${var.aws_region}"
profile = "${var.aws_profile}"
}

resource "aws_instance" "ansible" {
	ami = "ami-02eac2c0129f6376b"
	instance_type = "t2.micro"

	user_data = <<-EOF
							#!/bin/bash
							echo "Hello world" > index.html
							nohup busybox httpd -f -p 8080 &
							EOF

	tags {
		Name = "terransible-test"
	}
}

resource "aws_security_group" "instance" {
	name = "terraform-example-instance"

	ingress {
		from_port = 8080
		to_port = 8080
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
}
