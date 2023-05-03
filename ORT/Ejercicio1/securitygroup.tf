resource "aws_security_group" "allow_ssh" {
  name        = "22_tcp"
  description = "Allow 22 tcp inbound traffic"
  vpc_id      = aws_vpc.vpc_ej1.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}