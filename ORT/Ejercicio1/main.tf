resource "aws_instance" "instancia1" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  key_name = "ssh_key"
  network_interface {
    network_interface_id = aws_network_interface.nic_instancia.id
    device_index = 0
  }

  tags = {
    Name = "Instancia_desde_Terraform"
  }
}
resource "aws_vpc" "vpc_ej1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sub_net_us-east-1" {
  vpc_id            = aws_vpc.vpc_ej1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet_1"
  }
}

resource "aws_network_interface" "nic_instancia" {
  subnet_id   = aws_subnet.sub_net_us-east-1.id

  tags = {
    Name = "primary_network_interface"
  }
}