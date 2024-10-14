data "aws_vpc_endpoint" "sftp_vpc_endpoint" {
  vpc_id = var.vpc_id
}
