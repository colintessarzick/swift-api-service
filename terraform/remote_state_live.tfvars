bucket         = "rogue-terraform-remote-state"
key            = "swift-api-service/terraform-live.tfstate"
region         = "eu-central-1"
dynamodb_table = "rogue-terraform-remote-state-lock"
encrypt        = true
