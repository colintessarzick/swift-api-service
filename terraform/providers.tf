terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.53.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.17.0"
    }
  }

  backend "s3" {}

  required_version = "~> 1.3.0"
}


# -----------------------------------------------------------------------------
# DEFAULT AWS PROVIDERS TO USE FOR DIFFERENT REGIONS
# -----------------------------------------------------------------------------

provider "aws" {
  region = local.aws_regions.frankfurt
  default_tags {
    tags = local.common_tags
  }
  allowed_account_ids = [var.allowed_account_id]
}

provider "aws" {
  alias  = "ireland"
  region = local.aws_regions.ireland
  default_tags {
    tags = local.common_tags
  }
  allowed_account_ids = [var.allowed_account_id]
}

provider "github" {
  owner = "colintessarzick"
}
