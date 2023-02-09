# data "github_repository" "this" {
#   name = var.deployment_name
# }

resource "github_actions_secret" "app_runner_id" {
  repository      = "colintessarzick/${var.deployment_name}"
  secret_name     = "APP_RUNNER_ID"
  plaintext_value = aws_apprunner_service.api_service.id
}
