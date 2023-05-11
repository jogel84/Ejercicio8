resource "aws_vpc" "vpc_ej8" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_support = true
  enable_dns_hostnames = true
  }

resource "aws_subnet" "sub_net_us-east-1a" {
  vpc_id            = aws_vpc.vpc_ej8.id
  cidr_block        = "${var.subnet_cidr_a}"
  availability_zone = "${var.aws_az_a}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "subnet_1"
  }
}

resource "aws_subnet" "sub_net_us-east-1b" {
  vpc_id            = aws_vpc.vpc_ej8.id
  cidr_block        = "${var.subnet_cidr_b}"
  availability_zone = "${var.aws_az_b}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "subnet_2"
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vpc_ej8.id

  tags = {
    Name = "internet_gw"
  }
}

resource "aws_route_table" "tabla_rutas" {
  vpc_id = aws_vpc.vpc_ej8.id

  route {
    cidr_block = "${var.ruta_cidr}"
    gateway_id = aws_internet_gateway.internet_gw.id
  }
   
  tags = {
    Name = "tabla_rutas_internet_gateway"
  }
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub_net_us-east-1a.id
  route_table_id = aws_route_table.tabla_rutas.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.sub_net_us-east-1b.id
  route_table_id = aws_route_table.tabla_rutas.id
}