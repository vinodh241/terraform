variable "ami_id" {
  description = "AWS AMI ID or RHEL AMI ID "
  type        = string
  default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t3.micro"

}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name    = "Terraform_Roboshop"
    Purpose = "dynamic demo"
  }

}

variable "sg_name" {
  default = "dynamic demo"

}

variable "sg_description" {

  default = "allowing all ports form internet"

}

variable "to_port" {
  default = 0

}

variable "from_port" {
  default = 0
  type    = number

}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
  type    = list(string)

}

variable "sg_tags" {
  default = {
    Name = "dynamic demo"
  }

}

variable "ingress_port" {
  default = [
    {
      from_port = 0
      to_port   = 0
    },

    {
      from_port = 22
      to_port   = 22
    },
    {
      from_port = 80
      to_port   = 80
    },

  ]

}
variable "egress_port" {
  default = [
    {
      from_port = 0
      to_port   = 0
    },

    {
      from_port = 22
      to_port   = 22
    },
    {
      from_port = 80
      to_port   = 80
    },

  ]

}

