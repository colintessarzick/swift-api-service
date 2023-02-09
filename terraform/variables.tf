# -----------------------------------------------------------------------------
# DEFAULT VARIABLES FOR THE ENTIRE INFRASTRUCTURE STACK
# -----------------------------------------------------------------------------

variable "deployment_name" {
  type        = string
  description = "The name of the service or application"
}

variable "environment" {
  type        = string
  description = "The name of the environment to deploy to"
}

variable "aws_regions" {
  type        = map(string)
  description = "The AWS regions to deploy resources to"
  default     = {}
}

variable "allowed_account_id" {
  type        = string
  description = "The AWS account where resources will be created in"
}

variable "common_tags" {
  type        = map(string)
  description = "Common Aws resource tags"
  default     = {}
}


# -----------------------------------------------------------------------------
# CONSTANTS
# -----------------------------------------------------------------------------

locals {
  resource_prefix = "${var.deployment_name}-${var.environment}"
  common_tags = merge(var.common_tags, {
    managed_by  = "Terraform"
    environment = var.environment
    deployment  = var.deployment_name
  })
  aws_regions = merge(var.aws_regions, {
    frankfurt = "eu-central-1"
    ireland   = "eu-west-1"
    virginia  = "us-east-1"
  })
}
