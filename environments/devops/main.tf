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

module "devop_k8s" {
  source                                   = "../../modules/gke"
  k8s_project                              = var.project
  k8s_region                               = var.region
  k8s_cluster_location                     = var.zone
  k8s_additional_node_zones                = []
  k8s_vpc_name                             = var.vpc_name
  k8s_tier                                 = var.tier
  k8s_spot_tier                            = var.spot_tier
  k8s_subnet_name                          = var.subnet_name
  k8s_subnet_cidr                          = var.subnet_cidr
  k8s_pod_cidr                             = var.pod_cidr
  k8s_pod_cidr_name                        = var.pod_cidr_name
  k8s_svc_cidr                             = var.svc_cidr
  k8s_svc_cidr_name                        = var.svc_cidr_name
  k8s_cluster_name                         = var.cluster_name
  k8s_master_ipv4_cidr_block               = var.master_ipv4_cidr_block
  k8s_service_account_name                 = "${var.cluster_name}-ser-ac"
  k8s_tier_node_count                      = 1
  k8s_spot_tier_node_count                 = 0
  k8s_enable_managed_prometheus_monitoring = false
  k8s_cluster_node_pool_version            = var.cluster_version
}

module "devops_nginx_controller" {
  source                               = "../../modules/nginx_controller"
  nginx_controller_k8s_project         = var.cluster_name
  nginx_controller_helm_host           = module.devop_k8s.k8s_project_cluster_endpoint
  nginx_controller_helm_token          = module.devop_k8s.k8s_project_cluster_token
  nginx_controller_k8s_cluster_ca_cert = module.devop_k8s.k8s_project_cluster_cluster_ca_cert
  nginx_controller_project             = var.project
  nginx_controller_region              = var.region
}

module "devops_kcert_controller" {
  source                               = "../../modules/kcert"
  nginx_controller_k8s_project         = var.cluster_name
  nginx_controller_helm_host           = module.devop_k8s.k8s_project_cluster_endpoint
  nginx_controller_helm_token          = module.devop_k8s.k8s_project_cluster_token
  nginx_controller_k8s_cluster_ca_cert = module.devop_k8s.k8s_project_cluster_cluster_ca_cert
  kcert_letsencrypt_email              = var.letsencrypt_email
}
