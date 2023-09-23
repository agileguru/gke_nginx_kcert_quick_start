terraform {
  required_version = ">= 1.4.6"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.82.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.82.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.11.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0"
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
  source                 = "./environments/devops"
  project                = var.environment_project["devops"]
  region                 = var.environment_region["devops"]
  zone                   = var.environment_zone["devops"]
  cluster_name           = var.environment_cluster_name["devops"]
  cluster_version        = var.environment_k8s_version["devops"]
  letsencrypt_email      = var.environment_letsencrypt_email["devops"]
  vpc_name               = var.environment_vpc_name["devops"]
  tier                   = var.environment_tier["devops"]
  spot_tier              = var.environment_spot_tier["devops"]
  subnet_name            = var.environment_subnet_name["devops"]
  subnet_cidr            = var.environment_subnet_cidr["devops"]
  pod_cidr               = var.environment_pod_cidr["devops"]
  pod_cidr_name          = var.environment_pod_cidr_name["devops"]
  svc_cidr               = var.environment_svc_cidr["devops"]
  svc_cidr_name          = var.environment_svc_cidr_name["devops"]
  master_ipv4_cidr_block = var.environment_master_ipv4_cidr_block["devops"]
}
