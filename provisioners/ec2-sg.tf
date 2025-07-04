resource "aws_instance" "RoboShop" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags                   = var.ec2_tags

  provisioner "local-exec" {
    command = " ${self.private_ip} > private_ips.txt "
    on_failure = continue

  }

    provisioner "local-exec" {
    command = " echo ${self.private_ip}  private_ips.txt "
    on_failure = continue
    when = destroy

  }

}
resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description
  #vpc_id      = aws_vpc.main.id

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}