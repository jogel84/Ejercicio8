output "ip_instancia" {
    value = ["${aws_instance.instancia1.public_ip}"]
}