provider "aws" {
  region = var.region
}



resource "aws_eip" "CP-wp_ip" {
  instance = aws_instance.CP-web-server.id
  vpc      = true

  tags   = {
    Name = "CP-wp_ip"
  }
}

resource "aws_instance" "CP-web-server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ec2_instance_type
  associate_public_ip_address = true
  key_name                    = var.key_pair_name
  subnet_id                   = var.web_subnet_cidr
  security_groups             = [var.ssh_sec_group_id, var.web_sec_group_id]


#  user_data = data.template_cloudinit_config.cloudprepared-init.rendered

 root_block_device {
   volume_size           = 15 

  }

  tags   = {
    Name = "CP Web"
  }
}




