resource "aws_instance" "RoboShop" {
  count = 4
  ami           = var.ami_id   # Left side and variable no need to same
  instance_type = var.instance_type  # defined the variable in variables.tf file 
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  tags = {
    Name = var.instances[count.index]
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