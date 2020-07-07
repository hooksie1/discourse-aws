output "CP_vpc_id" {
  value = aws_vpc.cloudprepared.id
}

output "CP_vpc_cidr_block" {
  value = aws_vpc.cloudprepared.cidr_block
}


output "CP_web_subnet_id" {
value = aws_subnet.CP-web-subnet.id
}


output "CP_mgmt_subnet_id" {
  value = aws_subnet.CP-mgmt-subnet.id
}

output "CP_web_sg_id" {
  value = aws_security_group.CP-web-sg.id
}


output "CP_ssh_sg_id" {
  value = aws_security_group.CP-ssh-sg.id
}


