module "devop_k8s" {
  source                                   = "../../modules/gke"
  k8s_project                              = var.project
  k8s_region                               = var.region
  k8s_cluster_location                     = var.zone
  k8s_additional_node_zones                = []
  k8s_vpc_name                             = "devops-k8s-vpc"
  k8s_tier                                 = "e2-standard-2"
  k8s_spot_tier                            = "e2-standard-2"
  k8s_subnet_name                          = "devops-k8s-subnet"
  k8s_subnet_cidr                          = "10.0.0.0/18"
  k8s_pod_cidr                             = "10.48.0.0/14"
  k8s_pod_cidr_name                        = "devops-k8s-pod-cidr"
  k8s_svc_cidr                             = "10.52.0.0/20"
  k8s_svc_cidr_name                        = "devops-k8s-svc-cidr"
  k8s_cluster_name                         = "devops-k8s-cluster"
  k8s_master_ipv4_cidr_block               = "172.16.0.0/28"
  k8s_service_account_name                 = "devops-k8s-cluster-ser-ac"
  k8s_tier_node_count                      = 1
  k8s_spot_tier_node_count                 = 0
  k8s_enable_managed_prometheus_monitoring = false
  k8s_cluster_node_pool_version            = "1.27.4-gke.900"
}

module "devops_nginx_controller" {
  source                               = "../../modules/nginx_controller"
  nginx_controller_k8s_project         = "devops-k8s-cluster"
  nginx_controller_helm_host           = module.devop_k8s.k8s_project_cluster_endpoint
  nginx_controller_helm_token          = module.devop_k8s.k8s_project_cluster_token
  nginx_controller_k8s_cluster_ca_cert = module.devop_k8s.k8s_project_cluster_cluster_ca_cert
  nginx_controller_project             = var.project
  nginx_controller_region              = var.region
}

module "devops_kcert_controller" {
  source                               = "../../modules/kcert"
  nginx_controller_k8s_project         = "devops-k8s-cluster"
  nginx_controller_helm_host           = module.devop_k8s.k8s_project_cluster_endpoint
  nginx_controller_helm_token          = module.devop_k8s.k8s_project_cluster_token
  nginx_controller_k8s_cluster_ca_cert = module.devop_k8s.k8s_project_cluster_cluster_ca_cert
  kcert_letsencrypt_email              = "webtechguru@gmail.com"
}
