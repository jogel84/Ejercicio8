resource "aws_instance" "instancia1" {
  ami           = "${var.aws_ami}"
  instance_type = "${var.aws_instancia_tipo}"
  key_name = "${var.claves_ssh}"
  network_interface {
    network_interface_id = aws_network_interface.nic_instancia.id
    device_index = 0
  }

  tags = {
    Name = "Instancia_desde_Terraform"
  }
}