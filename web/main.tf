resource "aws_instance" "server" {
  ami           = "ami-029a761f237195c2c"
  instance_type = "t2.micro"
  subnet_id     = var.sn
  security_groups = [var.sg]

  tags = {
    Name = "myserver"
  }
  
}