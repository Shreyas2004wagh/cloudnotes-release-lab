


terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# No credentials required: the local provider only writes files on disk,
# which is enough to model "infrastructure" for this local-only exercise.
provider "local" {}

module "storage" {
  source      = "./modules/storage"
  bucket_name = var.bucket_name
  environment = var.environment
  labels      = var.labels
}

resource "local_file" "release_manifest" {
  filename = "${path.module}/.generated/${var.environment}-release-manifest.json"

  content = jsonencode({
    bucket      = var.bucket_name
    environment = var.environment
  })
}