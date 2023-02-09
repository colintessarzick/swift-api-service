resource "github_actions_secret" "app_runner_id" {
  repository      = var.deployment_name
  secret_name     = "APP_RUNNER_ID"
  plaintext_value = aws_apprunner_service.api_service.id
}

resource "github_actions_secret" "app_runner_role_arn" {
  repository      = var.deployment_name
  secret_name     = "APP_RUNNER_ARN"
  plaintext_value = aws_apprunner_service.api_service.service_arn
}
