variable "region" {
  default     = "us-east-1"
  description = "AWS Region"
}

variable "CP_vpc_cidr" {
}


variable "CP_web_subnet_cidr" {
}


variable "CP_mgmt_subnet_cidr" {
}

variable "home_ip" {
  description = "Home IP"
}

variable "vpn_ip" {
  description = "VPN IP"
}

variable "work_ip" {
  default = ""
  description = "Work IP"
}

