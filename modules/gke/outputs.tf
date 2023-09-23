output "k8s_project_cluster_endpoint" {
  value = google_container_cluster.cluster.endpoint
}

output "k8s_project_cluster_token" {
  value = data.google_client_config.client_config.access_token
}

output "k8s_project_cluster_cluster_ca_cert" {
  value = google_container_cluster.cluster.master_auth[0].cluster_ca_certificate
}
