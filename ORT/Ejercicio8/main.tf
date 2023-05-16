module "webapp-server-01" {
  source                  = "./modules/webapp-servers"
  imagen                  = var.aws_ami
  tamano_instancia        = var.aws_instancia_tipo
  zona_disponibilidad     = var.aws_az_a
  par_claves              = var.claves_ssh
  ids_grupo_de_seguridad  = [aws_security_group.allow_ssh_http_mysql.id]
  id_de_subnet            = aws_subnet.sub_net_us-east-1a.id
  comanditos              = var.comandos_deploy
}

module "webapp-server-02" {
  source                  = "./modules/webapp-servers"
  imagen                  = var.aws_ami
  tamano_instancia        = var.aws_instancia_tipo
  zona_disponibilidad     = var.aws_az_b
  par_claves              = var.claves_ssh
  ids_grupo_de_seguridad  = [aws_security_group.allow_ssh_http_mysql.id]
  id_de_subnet            = aws_subnet.sub_net_us-east-1b.id
  comanditos              = [
        "sudo apt-get update -y",
        "sudo apt-get install apache2 software-properties-common mysql-client -y",
        "sudo add-apt-repository ppa:ondrej/php -y",
        "sudo apt-get update -y",
        "sudo apt-get install php5.6 php5.6-mysql -y",
        "sudo a2enmod php5.6 ; sudo service apache2 restart",
        "sudo git -C /var/www/html/ clone https://github.com/mauricioamendola/simple-ecomme.git",
        "sudo rm -rf /var/www/html/simple-ecomme/config.php",
        "echo '<?php",
        "  ini_set(\"display_errors\", 1);",
        "  error_reporting(-1);",
        "  define(\"DB_HOST\", \"${aws_db_instance.base_datos.address}\");",
        "  define(\"DB_USER\", \"${var.rds_user}\");",
        "  define(\"DB_PASSWORD\", \"${var.rds_password}\");",
        "  define(\"DB_DATABASE\", \"${var.rds_dbname}\");",
        "?>' | sudo tee /var/www/html/simple-ecomme/config.php",
        "wget https://raw.githubusercontent.com/mauricioamendola/simple-ecomme/master/dump.sql",
        "mysql -h ${aws_db_instance.base_datos.address} -P ${aws_db_instance.base_datos.port} -u ${var.rds_user} -p${var.rds_password} ${var.rds_dbname} < ./dump.sql"
        ]
}