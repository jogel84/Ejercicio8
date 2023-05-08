resource "aws_vpc" "vpc_ej1" {
  cidr_block = "${var.vpc_cidr}"
  }

resource "aws_subnet" "sub_net_us-east-1" {
  vpc_id            = aws_vpc.vpc_ej1.id
  cidr_block        = "${var.subnet_cidr}"
  availability_zone = "${var.aws_az}"
  map_public_ip_on_launch = "true"

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
    cidr_block = "${var.ruta_cidr}"
    gateway_id = aws_internet_gateway.internet_gw.id
  }
   
  tags = {
    Name = "tabla_rutas"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub_net_us-east-1.id
  route_table_id = aws_route_table.tabla_rutas.id
}