module "webapp-server-01" {
  source                  = "./modules/webapp-servers"
  imagen                  = var.aws_ami
  tamano_instancia        = var.aws_instancia_tipo
  zona_disponibilidad     = var.aws_az_a
  par_claves              = var.claves_ssh
  ids_grupo_de_seguridad  = [aws_security_group.allow_ssh_http.id]
  id_de_subnet            = aws_subnet.sub_net_us-east-1a.id
  comanditos              = var.comandos_deploy
  
}

module "webapp-server-02" {
  source                  = "./modules/webapp-servers"
  imagen                  = var.aws_ami
  tamano_instancia        = var.aws_instancia_tipo
  zona_disponibilidad     = var.aws_az_b
  par_claves              = var.claves_ssh
  ids_grupo_de_seguridad  = [aws_security_group.allow_ssh_http.id]
  id_de_subnet            = aws_subnet.sub_net_us-east-1b.id
  comanditos              = var.comandos_deploy
  
}

