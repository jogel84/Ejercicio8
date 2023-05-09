resource "aws_instance" "generica" {
  ami                       = var.imagen
  instance_type             = var.tamano_instancia
  availability_zone         = var.zona_disponibilidad
  key_name                  = var.par_claves
  vpc_security_group_ids    = var.ids_grupo_de_seguridad
  subnet_id                 = var.id_de_subnet

  tags = {
    Name = var.nombre_instancia
  }
}