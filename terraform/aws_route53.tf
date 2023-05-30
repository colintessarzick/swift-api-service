data "aws_route53_zone" "domain" {
  name         = var.root_domain
  private_zone = false
}

resource "aws_route53_record" "public_domain" {
  for_each = var.validate_custom_domain ? {
    for dvo in aws_acm_certificate.public_domain[0].domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  } : {}

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  type            = each.value.type
  ttl             = 60
  zone_id         = data.aws_route53_zone.domain.zone_id
}

resource "aws_route53_record" "api_service_domain_mapping" {
  for_each = var.validate_custom_domain ? {
    for dvo in aws_apprunner_custom_domain_association.api_service[0].certificate_validation_records : dvo.name => {
      name   = dvo.name
      type   = dvo.type
      record = dvo.value
    }
  } : {}

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  type            = each.value.type
  ttl             = 60
  zone_id         = data.aws_route53_zone.domain.zone_id
}

resource "aws_route53_record" "app_runner_dns_target" {
  count = var.validate_custom_domain ? 1 : 0

  allow_overwrite = true
  name            = local.public_service_domain
  records         = [aws_apprunner_service.api_service[0].default_domain]
  type            = "CNAME"
  ttl             = 60
  zone_id         = data.aws_route53_zone.domain.zone_id
}
