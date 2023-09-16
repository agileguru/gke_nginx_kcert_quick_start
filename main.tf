terraform {
  required_providers {
    google = {
      version = ">= 4.82.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.82.0"
    }
  }
}

provider "google" {
  alias = "global_google"
}

provider "google-beta" {
  alias = "global_google_beta"
}

module "devops" {
  source  = "./environments/devops"
  project = var.environment_project["devops"]
  region  = var.environment_region["devops"]
  zone    = var.environment_zone["devops"]
  # providers = {
  #   google      = google.global_google
  #   google-beta = google.global_google_beta
  # }
}
