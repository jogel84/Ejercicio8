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

variable "aws_az_a" {
  type = string
  description = "Variable para la Zona de diponibilidad"
}

variable "aws_az_b" {
  type = string
  description = "Variable para la Zona de diponibilidad"
}

variable "vpc_cidr" {
  type = string
  description = "Variable para el CIDR block"
}

variable "subnet_cidr_a" {
  type = string
  description = "Variable para la subnet CIDR A"
}

variable "subnet_cidr_b" {
  type = string
  description = "Variable para la subnet CIDR B"
}

variable "ruta_cidr" {
  type = string
  description = "Variable para la ruta CIDR por defecto"
}

variable "claves_ssh" {
  type = string
  description = "Variable para nombre de claves ssh"
}

variable "comandos_deploy" {
  type = list(string)
  description = "Lista de comandos para ejecutar"
}