resource "aws_apprunner_service" "api_service" {
  provider = aws.ireland

  service_name = local.resource_prefix

  source_configuration {
    image_repository {
      image_configuration {
        port = "5813"
      }
      image_identifier      = "${aws_ecr_repository.api_service.repository_url}:latest"
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = false

    authentication_configuration {
      access_role_arn = aws_iam_role.api_service_app_runner.arn
    }
  }
}
