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
  source            = "./environments/devops"
  project           = var.environment_project["devops"]
  region            = var.environment_region["devops"]
  zone              = var.environment_zone["devops"]
  cluster_name      = var.environment_cluster_name["devops"]
  cluster_version   = var.environment_k8s_version["devops"]
  letsencrypt_email = var.environment_letsencrypt_email["devops"]
}
