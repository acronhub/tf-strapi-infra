terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.61.0"
    }
  }

  # GCSの作成前はコメントアウト
  # ※環境変数が使えないので直接書く
  backend "gcs" {
    bucket  = "tf-office-shiratama-corp-state-store"
  }
}

provider "google" {
  project     = var.project_name
  region      = var.region
}

resource "google_storage_bucket" "tf-state-store" {
  name     = "tf-${var.project_name}-state-store"
  location = var.region
  storage_class = "REGIONAL"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 5
    }
  }
}