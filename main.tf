provider "aws" {
  region = var.aws_region
}

# ======================
# EXISTING VPC
# ======================
data "aws_vpc" "existing" {
  id = var.vpc_id
}

# ======================
# EXISTING SUBNETS (MULTI AZ)
# ======================
data "aws_subnet" "private" {
  count = length(var.private_subnet_ids)
  id    = var.private_subnet_ids[count.index]
}

# ======================
# EXISTING SECURITY GROUP
# ======================
data "aws_security_group" "existing" {
  id = var.security_group_id
}

# ======================
# EC2 MASTER (PRIVATE)
# ======================
resource "aws_instance" "master" {
  ami                    = var.ami
  instance_type          = "t3.small"
  subnet_id              = data.aws_subnet.private[0].id
  key_name               = var.key_name
  vpc_security_group_ids = [data.aws_security_group.existing.id]

  tags = {
    Name = "Server Master"
  }
}

# ======================
# EC2 WORKER (MULTI AZ)
# ======================
resource "aws_instance" "worker" {
  count = length(var.private_subnet_ids)

  ami                    = var.ami
  instance_type          = "t3.small"
  subnet_id              = data.aws_subnet.private[count.index].id
  key_name               = var.key_name
  vpc_security_group_ids = [data.aws_security_group.existing.id]

  tags = {
    Name = "Server-${count.index + 1}"
  }
}
