data "aws_iam_policy_document" "app_runner" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["build.apprunner.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "api_service_app_runner" {
  name               = "${local.resource_prefix}-app-runner"
  assume_role_policy = data.aws_iam_policy_document.app_runner.json
}

resource "aws_iam_role_policy_attachment" "api_service_app_runner" {
  role       = aws_iam_role.api_service_app_runner.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}
