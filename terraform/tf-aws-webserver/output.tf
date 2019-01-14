output "ec2-dns-name" {
  value = "${aws_instance.tf-aws-webserver.public_dns}"
}