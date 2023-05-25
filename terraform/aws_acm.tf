resource "aws_acm_certificate" "public_domain" {
  count    = var.deploy_custom_domain ? 1 : 0
  provider = aws.ireland

  domain_name       = local.public_service_domain
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "public_domain" {
  count    = var.validate_custom_domain ? 1 : 0
  provider = aws.ireland

  certificate_arn         = aws_acm_certificate.public_domain[0].arn
  validation_record_fqdns = [for record in aws_route53_record.public_domain : record.fqdn]
}
