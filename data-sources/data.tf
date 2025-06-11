data "aws_ami" "joindevops" {
  #owners      = ["381491877014"]
  most_recent = "true"

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
output "ami_id" {
  value = data.aws_ami.joindevops.id
}
