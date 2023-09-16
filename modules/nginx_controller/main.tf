provider "helm" {
  kubernetes {
    host                   = "https://${var.nginx_controller_helm_host}"
    token                  = var.nginx_controller_helm_token
    cluster_ca_certificate = base64decode(var.nginx_controller_k8s_cluster_ca_cert)
  }
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
}
