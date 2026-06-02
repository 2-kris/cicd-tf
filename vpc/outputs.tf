output "pb_sn" {
  value = aws_subnet.mysubnet.id
}

output "pb_sg" {
  value = aws_security_group.mysecuritygroup.id
}