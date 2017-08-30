#
# Bastion EC2 Instance
#
# https://www.terraform.io/docs/providers/aws/r/instance.html
resource "aws_instance" "bastion-ec2" {
  key_name      = "${var.key_name}"
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "${var.instance_type}"

  subnet_id                   = "${element(var.public_subnet_ids, 0)}"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.sg_ssh_for_bastion.id}"]

  tags = {
    Name = "tf_bastion"
  }
}

output "bastion-ec2_id" {
  value = "${aws_instance.bastion-ec2.id}"
}
