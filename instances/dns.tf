resource "aws_route53_record" "cloudprepared_A_record" {
  zone_id = var.dns_zone 
  name    = var.domain_name
  type    = "A"
  ttl     = "300"
  records = [aws_eip.CP-wp_ip.public_ip]
}








