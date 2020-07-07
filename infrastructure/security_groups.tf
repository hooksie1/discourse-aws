resource "aws_security_group" "CP-web-sg" {
  name        = "CP-web-sg"
  description = "Allow external web access"
  vpc_id      = aws_vpc.cloudprepared.id


  ingress {
    from_port   = 443
    protocol    = "TCP"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
    Name = "CP-web-sg"
  }

}

resource "aws_security_group" "CP-ssh-sg" {
  name        = "CP-ssh-sg"
  description = "Internet reaching access for EC2 Instances"
  vpc_id      = aws_vpc.cloudprepared.id

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = [var.home_ip, var.vpn_ip, var.work_ip]

  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

