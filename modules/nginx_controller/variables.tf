variable "nginx_controller_helm_host" {
  type        = string
  description = "The endpoint of the k8s cluster"
}

variable "nginx_controller_helm_token" {
  type        = string
  description = "The token of the k8s cluster"
}

variable "nginx_controller_k8s_project" {
  type        = string
  description = "The Project where the k8s cluster is installed"
}

variable "nginx_controller_k8s_cluster_ca_cert" {
  type        = string
  description = "The CA certificate of the k8s cluster"
}

variable "nginx_controller_repository" {
  type        = string
  description = "The helm repository"
  default     = "https://kubernetes.github.io/ingress-nginx"
}

variable "nginx_controller_chart" {
  type        = string
  description = "The helm chart"
  default     = "ingress-nginx"
}

variable "nginx_controller_chart_version" {
  type        = string
  description = "The helm chart version"
  default     = "4.6.0"
}
