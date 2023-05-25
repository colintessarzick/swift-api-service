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

variable "initial_deployment" {
  type        = bool
  description = "Whether this is the first deployment of the service"
  default     = false
}

variable "deploy_custom_domain" {
  type        = bool
  description = "Whether to deploy a custom domain for the service"
  default     = true
}

variable "validate_custom_domain" {
  type        = bool
  description = "Whether to validate the custom domain for the service"
  default     = true
}

variable "root_domain" {
  type        = string
  description = "The root domain name for the application"
  default     = "chrood.com"
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
  public_service_domain = "${var.environment}.demo.${var.root_domain}"
}
