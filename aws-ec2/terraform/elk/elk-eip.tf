#
# ELK Elastic IP
#
# https://www.terraform.io/docs/providers/aws/r/eip.html
resource "aws_eip" "kafka_eip" {
  instance = "${aws_instance.elk_ec2.id}"
  vpc      = true

  tags = {
    Name = "tf-kafka_eip"
  }
}
output "kafka_eip-id" {
  value = "${aws_eip.kafka_eip.id}"
}

resource "aws_eip" "kafka_eip2" {
  instance = "${aws_instance.elk_ec2_2.id}"
  vpc      = true

  tags = {
    Name = "tf-kafka_eip2"
  }
}
output "kafka_eip2-id" {
  value = "${aws_eip.kafka_eip2.id}"
}

resource "aws_eip" "kafka_eip3" {
  instance = "${aws_instance.elk_ec2_3.id}"
  vpc      = true

  tags = {
    Name = "tf-kafka_eip3"
  }
}
output "kafka_eip3-id" {
  value = "${aws_eip.kafka_eip3.id}"
}


output "kafka_eip-public_ip" {
  value = "${aws_eip.kafka_eip.public_ip}"
}

output "kafka_eip-private_ip" {
  value = "${aws_eip.kafka_eip.private_ip}"
}



# https://www.terraform.io/docs/providers/aws/r/eip_association.html
resource "aws_eip_association" "elk_eip_association" {
  instance_id   = "${aws_instance.elk_ec2.id}"
  allocation_id = "${aws_eip.kafka_eip.id}"
}

resource "aws_eip_association" "elk2_eip_association" {
  instance_id   = "${aws_instance.elk_ec2_2.id}"
  allocation_id = "${aws_eip.kafka_eip2.id}"
}

resource "aws_eip_association" "elk3_eip_association" {
  instance_id   = "${aws_instance.elk_ec2_3.id}"
  allocation_id = "${aws_eip.kafka_eip3.id}"
}