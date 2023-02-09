resource "aws_ecr_repository" "api_service" {
  provider     = aws.ireland
  name         = "${local.resource_prefix}-container-repository"
  force_delete = true
}
