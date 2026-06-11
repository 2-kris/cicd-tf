resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "myvpc"
  }
  
}

resource "aws_subnet" "mysubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "mysubnet"
  }
}

resource "aws_security_group" "mysecuritygroup" {
  name        = "mysecuritygroup"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.myvpc.id

  resource "aws_security_group_rule" "ssh" {
    security_group_id = aws_security_group.mysecuritygroup.id
    type              = "ingress"
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]

  }
  
  resource "aws_security_group_rule" "https" {
    security_group_id = aws_security_group.mysecuritygroup.id
    type              = "ingress"
    from_port         = 443
    to_port           = 443
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
  }

  resource "aws_security_group_rule" "egress" {
    security_group_id = aws_security_group.mysecuritygroup.id
    type              = "egress"
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
  }
}