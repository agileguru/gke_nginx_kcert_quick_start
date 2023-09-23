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

provider "helm" {
  kubernetes {
    host                   = "https://${var.nginx_controller_helm_host}"
    token                  = var.nginx_controller_helm_token
    cluster_ca_certificate = base64decode(var.nginx_controller_k8s_cluster_ca_cert)
  }
}

resource "helm_release" "kcert_letsencrypt" {

  name             = "${var.nginx_controller_k8s_project}-k8s-kcert"
  repository       = var.kcert_controller_repository
  chart            = var.kcert_controller_chart
  version          = var.kcert_controller_chart_version
  namespace        = var.kcert_controller_namespace
  create_namespace = var.kcert_controller_create_namespace

  set {
    name  = "acmeTermsAccepted"
    value = "true"
  }

  set {
    name  = "acmeEmail"
    value = var.kcert_letsencrypt_email
  }

  set {
    name  = "acmeDirUrl"
    value = "https://acme-v02.api.letsencrypt.org/directory"
  }
}
