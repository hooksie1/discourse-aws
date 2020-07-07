variable "region" {
  default     = "us-east-1"
  description = "AWS Region"
}

variable "ec2_instance_type" {
  description = "EC2 Instance type to launch"
}

variable "key_pair_name" {
  description = "Keypair to use to connect to EC2 Instances"
}

variable "max_instance_size" {
  description = "Maximum number of instances to launch"
}

variable "min_instance_size" {
  description = "Minimum number of instances to launch"
}

variable "default_ami" {
  description = "Default AMI"
}

variable "wazuh_ec2_instance_type" {
  description = "EC2 Instance type to launch"
}

variable "vpn_subnet_cidr" {
  description = "VPN Subnet CIDR"
}

variable "db_subnet_cidr" {
  description = "DB Subnet CIDR"
}

variable "app_subnet_cidr" {
  description = "DB Subnet CIDR"
}

variable "mgmt_subnet_cidr" {
  description = "DB Subnet CIDR"
}

variable "web_subnet_cidr" {
  description = "DB Subnet CIDR"
}
variable "home_ip" {
  description = "Home IP"
}

variable "vpn_ip" {
  description = "VPN IP"
}

variable "wazuh_manager_sh" {
  default = ""
}

variable "work_ip" {
  default = ""
}

variable "domain_name" {
  default = ""
}

variable "dns_zone" {
  default = ""
}

variable "web_sec_group_id" {
  default = ""
}

variable "web_sec_group_id" {
  default = ""
}