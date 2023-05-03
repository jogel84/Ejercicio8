resource "aws_vpc" "vpc_ej1" {
  cidr_block = "172.16.0.0/16"
}

resource "aws_subnet" "sub_net_us-east-1" {
  vpc_id            = aws_vpc.vpc_ej1.id
  cidr_block        = "172.16.1.0/24"
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

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vpc_ej1.id

  tags = {
    Name = "internet_gw_tr"
  }
}

resource "aws_route_table" "tabla_rutas" {
  vpc_id = aws_vpc.vpc_ej1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }
   
  tags = {
    Name = "tabla_rutas"
  }
}
