provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "image" {
  most_recent = true
  owners = ["self"]
  filter {                       
    name = "tag:Name"     
    values = ["packer-aws-webserver-gold"]
  }                              
}

resource "aws_instance" "tf-aws-webserver" {
  ami                    = "${data.aws_ami.image.id}"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.tf-aws-webserver-sg.id}"]

  tags {
    Name = "tf-aws-webserver"
  }
}

resource "aws_security_group" "tf-aws-webserver-sg" {
  name = "tf-aws-webserver-sg"

  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
