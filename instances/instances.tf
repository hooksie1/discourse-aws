provider "aws" {
  region = var.region
}

data "terraform_remote_state" "network_configuration" {
  backend = "s3"

  config = {
    bucket = var.remote_state_bucket
    key    = var.remote_state_key
    region = var.region
  }
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
  subnet_id                   = data.terraform_remote_state.network_configuration.outputs.CP_web_subnet_id
  security_groups             = [data.terraform_remote_state.network_configuration.outputs.CP_ssh_sg_id, data.terraform_remote_state.network_configuration.outputs.CP_web_sg_id]


#  user_data = data.template_cloudinit_config.cloudprepared-init.rendered

 root_block_device {
   volume_size           = 15 

  }

  tags   = {
    Name = "CP Web"
  }
}




