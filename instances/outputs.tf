
output "CP_host_id" {
  value = aws_instance.CP-web-server.host_id
}

output "CP_public_ip" {
  value = aws_eip.CP-wp_ip.public_ip
}


output "CP_private_ip" {
  value = aws_instance.CP-web-server.private_ip
}


output "CP_security_groups" {
  value = aws_instance.CP-web-server.security_groups
}

output "CP_instance_type" {
  value = aws_instance.CP-web-server.instance_type
}

output "CP_key_name" {
  value = aws_instance.CP-web-server.key_name
}


output "CP_availability_zone" {
  value = aws_instance.CP-web-server.availability_zone
}
