resource "aws_instance" "server" {
  ami           = "ami-0d13e2317a7e75c95"
  instance_type = "t2.micro"
  subnet_id     = var.sn
  security_groups = [var.sg]

  tags = {
    Name = "myserver"
  }
  
}