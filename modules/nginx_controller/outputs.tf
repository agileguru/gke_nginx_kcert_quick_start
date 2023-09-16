
output "k8s_nginx_controller_lb_ip" {
  value = google_compute_address.reserved_static_ip.address
}
