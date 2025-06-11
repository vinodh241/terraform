resource "aws_instance" "RoboShop" {
  ami                    = var.ami_id        # Left side and variable no need to same
  instance_type          = var.instance_type # defined the variable in variables.tf file 
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags                   = var.ec2_tags
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description
  #vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_port
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = "-1"
      cidr_blocks      = var.cidr_blocks
      ipv6_cidr_blocks = ["::/0"]
    }
  }
  # dynamic "egress_port" {
  #   for_each = var.egress_port
  #   content {
  #     from_port        = ingress.value["from_port"]
  #     to_port          = ingress.value["to_port"]
  #     protocol         = "-1"
  #     cidr_blocks      = var.cidr_blocks
  #     ipv6_cidr_blocks = ["::/0"]
  #   }
  # }

  tags = var.sg_tags
}