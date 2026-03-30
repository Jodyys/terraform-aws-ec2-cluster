variable "aws_region" {
  default = "us-east-1"
}

variable "ami" {}
variable "key_name" {}

# EXISTING
variable "vpc_id" {}
variable "security_group_id" {}

# MULTI AZ
variable "private_subnet_ids" {
  type = list(string)
}
