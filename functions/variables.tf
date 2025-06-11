variable "ami_id" {
  description = "AWS AMI ID or RHEL AMI ID "
  type        = string
  default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
        default = "t3.micro"
  
}

variable "ec2_tags" {
    type = map (string)
    default = {
        Name = "Terraform_Roboshop"
        Purpose = "Variables demo"
    }
  
}

variable "sg_name" {
    default = "allow_all"
  
}

variable "sg_description" {

    default = "allowing all ports form internet"
  
}

variable "to_port" {
    default = 0
  
}

variable "from_port" {
    default = 0
    type = number
  
}

variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
    type = list(string)
  
}

variable "sg_tags" {
    default = {
        Name = "vinodh"
    }
  
}

variable "instances" {
    default = ["mongodb","redis","mysql","rabbitmq"]
  
}

variable "zone_id" {
    default = "Z07082243VUB84KU714AG"
  
}

variable "domian_name" {
    default = "vinodh.site"
  
}
variable "common_tags" {
    default = {
        project = "roboshop"
        Terraform = "true"
    }
  
}