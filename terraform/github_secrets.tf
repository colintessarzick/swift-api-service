resource "github_actions_secret" "app_runner_id" {
  count = var.initial_deployment ? 0 : 1

  repository      = var.deployment_name
  secret_name     = var.environment == "live" ? "LIVE_APP_RUNNER_ID" : "TEST_APP_RUNNER_ID"
  plaintext_value = aws_apprunner_service.api_service[0].id
}

resource "github_actions_secret" "app_runner_role_arn" {
  count = var.initial_deployment ? 0 : 1

  repository      = var.deployment_name
  secret_name     = var.environment == "live" ? "LIVE_APP_RUNNER_ARN" : "TEST_APP_RUNNER_ARN"
  plaintext_value = aws_apprunner_service.api_service[0].arn
}
