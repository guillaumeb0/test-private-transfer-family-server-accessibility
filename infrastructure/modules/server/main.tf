resource "aws_subnet" "s1" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "s2" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "this" {
  name        = "yo"
  description = "lo"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = -1
}

resource "aws_vpc_security_group_egress_rule" "this" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = -1
}

resource "aws_transfer_server" "this" {
  endpoint_type = "VPC"

  endpoint_details {
    subnet_ids             = [aws_subnet.s1.id, aws_subnet.s2.id]
    vpc_id                 = var.vpc_id
    security_group_ids = [aws_security_group.this.id]
  }
}
