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

resource "google_compute_address" "reserved_static_ip" {
  name    = "${var.nginx_controller_k8s_project}-k8s-nginx-lb-reserved-ip"
  project = var.nginx_controller_project
  region  = var.nginx_controller_region
}

resource "helm_release" "nginx_controller" {

  name       = "${var.nginx_controller_k8s_project}-k8s-nginx"
  repository = var.nginx_controller_repository
  chart      = var.nginx_controller_chart
  version    = var.nginx_controller_chart_version

  set {
    name  = "controller.admissionWebhooks.enabled"
    value = "false"
  }

  set {
    name  = "controller.service.loadBalancerIP"
    value = google_compute_address.reserved_static_ip.address
  }
}
