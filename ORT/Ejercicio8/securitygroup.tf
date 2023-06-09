resource "aws_security_group" "allow_ssh_http_mysql" {
  name        = "22/80/3306_tcp"
  description = "Permite 22/80/3306 tcp inbound traffic"
  vpc_id      = aws_vpc.vpc_ej8.id

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

  ingress {
    description      = "MYSQL"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }


  tags = {
    Name = "allow_ssh_http_mysql"
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