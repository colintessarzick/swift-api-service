resource "aws_apprunner_service" "api_service" {
  count    = var.initial_deployment ? 0 : 1
  provider = aws.ireland

  depends_on = [aws_apprunner_observability_configuration.api_service[0], aws_apprunner_auto_scaling_configuration_version.api_service[0]]

  service_name = local.resource_prefix

  source_configuration {
    image_repository {
      image_configuration {
        port = "5813"
        runtime_environment_variables = {
          ENVIRONMENT = var.environment
        }
      }
      image_identifier      = "${aws_ecr_repository.api_service.repository_url}:latest"
      image_repository_type = "ECR"
    }
    auto_deployments_enabled = false

    authentication_configuration {
      access_role_arn = aws_iam_role.api_service_app_runner.arn
    }
  }

  observability_configuration {
    observability_configuration_arn = aws_apprunner_observability_configuration.api_service[0].arn
    observability_enabled           = true
  }

  auto_scaling_configuration_arn = aws_apprunner_auto_scaling_configuration_version.api_service[0].arn
}

resource "aws_apprunner_observability_configuration" "api_service" {
  count    = var.initial_deployment ? 0 : 1
  provider = aws.ireland

  observability_configuration_name = local.resource_prefix

  trace_configuration {
    vendor = "AWSXRAY"
  }
}

resource "aws_apprunner_auto_scaling_configuration_version" "api_service" {
  count    = var.initial_deployment ? 0 : 1
  provider = aws.ireland

  auto_scaling_configuration_name = local.resource_prefix

  max_concurrency = 30
  max_size        = 10
  min_size        = 1
}

resource "aws_apprunner_custom_domain_association" "api_service" {
  count    = var.deploy_custom_domain ? 1 : 0
  provider = aws.ireland

  domain_name = local.public_service_domain
  service_arn = aws_apprunner_service.api_service[0].arn
}
