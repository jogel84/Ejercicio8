resource "aws_security_group" "allow_ssh" {
  name        = "22_tcp"
  description = "Allow 22/80 tcp inbound traffic"
  vpc_id      = aws_vpc.vpc_ej1.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
  
  egress {
    description      = "Navegacion"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks      = ["::/0"]
  }

}