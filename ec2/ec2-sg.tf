resource "aws_instance" "RoboShop" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  tags = {
    Name = "Terraform-Roboshop"
  }
}
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id

    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

  tags = {
    Name = "vinodh"
  }
}