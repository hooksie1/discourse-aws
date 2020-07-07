provider "aws" {
  region = var.region
}

resource "aws_vpc" "cloudprepared" {
  cidr_block           = var.CP_vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Cloudprepared Environment"
  }
}


resource "aws_subnet" "CP-web-subnet" {
  cidr_block        = var.CP_web_subnet_cidr
  vpc_id            = aws_vpc.cloudprepared.id
  availability_zone = "us-east-1b"

  tags = {
    Name = "CP-web-subnet"
  }
}


resource "aws_subnet" "CP-mgmt-subnet" {
  cidr_block        = var.CP_mgmt_subnet_cidr
  vpc_id            = aws_vpc.cloudprepared.id
  availability_zone = "us-east-1c"

  tags = {
    Name = "CP-mgmt-subnet"
  }
}

resource "aws_route_table" "CP-public-route-table" {
  vpc_id = aws_vpc.cloudprepared.id

  tags = {
    Name = "CP-Public-Route-Table"
  }
}

resource "aws_route_table" "CP-private-route-table" {
  vpc_id = aws_vpc.cloudprepared.id

  tags = {
    Name = "CP-Private-Route-Table"
  }
}


resource "aws_route_table_association" "CP-web-subnet-association" {
  route_table_id = aws_route_table.CP-public-route-table.id
  subnet_id      = aws_subnet.CP-web-subnet.id
}



resource "aws_route_table_association" "CP-mgmt-subnet-association" {
  route_table_id = aws_route_table.CP-public-route-table.id
  subnet_id      = aws_subnet.CP-mgmt-subnet.id
}

resource "aws_eip" "CP-elastic-ip-for-nat-gw" {
  vpc                       = true
  tags = {
    Name = "CP-EIP"
  }
}

resource "aws_nat_gateway" "CP-nat-gw" {
  allocation_id = aws_eip.CP-elastic-ip-for-nat-gw.id
  subnet_id     = aws_subnet.CP-web-subnet.id

  tags = {
    Name = "CP-NAT-GW"
  }

  depends_on = [aws_eip.CP-elastic-ip-for-nat-gw]
}

resource "aws_route" "CP-nat-gw-route" {
  route_table_id         = aws_route_table.CP-private-route-table.id
  nat_gateway_id         = aws_nat_gateway.CP-nat-gw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_internet_gateway" "CP-igw" {
  vpc_id = aws_vpc.cloudprepared.id

  tags = {
    Name = "CP-IGW"
  }
}

resource "aws_route" "CP-public-internet-gw-route" {
  route_table_id         = aws_route_table.CP-public-route-table.id
  gateway_id             = aws_internet_gateway.CP-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

