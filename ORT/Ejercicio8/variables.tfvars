aws_ami             = "ami-007855ac798b5175e"
aws_instancia_tipo  = "t2.micro" 
aws_region          = "us-east-1"
aws_az_a            = "us-east-1a"
aws_az_b            = "us-east-1b"
vpc_cidr            = "10.0.0.0/16"
subnet_cidr_a       = "10.0.1.0/24"
subnet_cidr_b       = "10.0.2.0/24"
ruta_cidr           = "0.0.0.0/0"
claves_ssh          = "vockey"
rds_user            = "root"
rds_password        = "R00t_123456"
rds_dbname          = "idukan"
comandos_deploy     = [
        "sudo apt-get update -y",
        "sudo apt-get install apache2 software-properties-common mysql-client -y",
        "sudo add-apt-repository ppa:ondrej/php -y",
        "sudo apt-get update -y",
        "sudo apt-get install php5.6 php5.6-mysql -y",
        "sudo a2enmod php5.6 ; sudo service apache2 restart",
        "sudo git -C /var/www/html/ clone https://github.com/mauricioamendola/simple-ecomme.git",
        "sudo rm -rf /var/www/html/simple-ecomme/config.php"]