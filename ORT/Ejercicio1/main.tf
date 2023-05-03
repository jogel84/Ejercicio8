resource "aws_instance" "instancia1" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  key_name = "ssh_key"
  network_interface {
    network_interface_id = aws_network_interface.nic_instancia.id
    device_index = 0
  }

  tags = {
    Name = "Instancia_desde_Terraform"
  }
}