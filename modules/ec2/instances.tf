resource "aws_instance" "web" {
  count         = "${var.ec2_count}"
  #ami           = "${var.ami_id}"
  #instance_type = "${var.instance_type}"
  ami            = "ami-0533f2ba8a1995cf9"
  instance_type  = "t2.micro"
  subnet_id     = "${var.subnet_id}"

  #tags {
  #  Name = "HelloWorld"
  #}
}
