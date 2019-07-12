#---Sadielo---

provider "aws" {
region = "${var.aws_region}"
profile = "${var.aws_profile}"
}

resource "aws_instance" "ansible" {
	ami = "ami-02eac2c0129f6376b"
	instance_type = "t2.micro"

	tags {
		Name = "ansible-test"
	}
}
