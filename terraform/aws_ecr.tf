resource "aws_ecr_repository" "api_service" {
  provider     = aws.ireland
  name         = "${var.deployment_name}-container-repository"
  force_delete = true
}
