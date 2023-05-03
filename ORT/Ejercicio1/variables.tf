variable "aws_ami" {
  type = string
  description = "Variable para la region"
}

variable "aws_instancia_tipo" {
  type = string
  description = "Variable para el tipo de instancia"
}

variable "aws_region" {
  type = string
  description = "Variable para la region"
}

variable "aws_az" {
  type = string
  description = "Variable para la Zona de diponibilidad"
}

variable "vpc_cidr" {
  type = string
  description = "Variable para el CIDR block"
}

variable "subnet_cidr" {
  type = string
  description = "Variable para la subnet CIDR"
}

variable "ruta_cidr" {
  type = string
  description = "Variable para la ruta CIDR por defecto"
}

variable "claves_ssh" {
  type = string
  description = "Variable para nombre de claves ssh"
}