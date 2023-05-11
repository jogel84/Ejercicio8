aws_ami = "ami-007855ac798b5175e"
aws_instancia_tipo = "t2.micro" 
aws_region = "us-east-1"
aws_az_a = "us-east-1a"
aws_az_b = "us-east-1b"
vpc_cidr = "10.0.0.0/16"
subnet_cidr_a = "10.0.1.0/24"
subnet_cidr_b = "10.0.2.0/24"
ruta_cidr = "0.0.0.0/0"
claves_ssh = "vockey"
comandos_deploy = [
    "sudo apt-get install apache2 git php5.6 php-mysql -y",
    "sudo git -C /var/www/html clone https://github.com/mauricioamendola/simple-ecomme.git",
    "sudo systemctl start apache2"]