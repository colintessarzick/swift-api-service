data "aws_route53_zone" "domain" {
  name         = var.root_domain
  private_zone = false
}

resource "aws_route53_record" "public_domain" {
  for_each = {
    for dvo in aws_acm_certificate.public_domain.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  type            = each.value.type
  ttl             = 60
  zone_id         = data.aws_route53_zone.domain.zone_id
}

# resource "aws_route53_record" "api_service_domain_mapping" {
#   depends_on = [aws_apprunner_custom_domain_association.api_service]

#   for_each = aws_apprunner_custom_domain_association.api_service.certificate_validation_records

#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.value]
#   type            = each.value.type
#   ttl             = 60
#   zone_id         = data.aws_route53_zone.domain.zone_id
# }
