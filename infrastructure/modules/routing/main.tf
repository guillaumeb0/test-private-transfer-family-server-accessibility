resource "aws_route53_record" "this" {
  zone_id = var.route53_zone_id
  name    = "test.gba.internal"
  type    = "CNAME"
  ttl     = 300
  records = [data.aws_vpc_endpoint.sftp_vpc_endpoint.dns_entry[0].dns_name]
}
