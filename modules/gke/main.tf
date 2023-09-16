# We are dependend on compute services 
resource "google_project_service" "compute" {
  service            = "compute.googleapis.com"
  disable_on_destroy = false
  project            = var.k8s_project
}

# We are dependend on container services 
resource "google_project_service" "container" {
  service            = "container.googleapis.com"
  disable_on_destroy = false
  project            = var.k8s_project
}

# We are creating a new VPC for each env
resource "google_compute_network" "vpc" {
  name                            = var.k8s_vpc_name
  project                         = var.k8s_project
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false
  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}

# Subnet for Workloads having ip range for pods & svc
resource "google_compute_subnetwork" "subnet" {
  name                     = var.k8s_subnet_name
  project                  = var.k8s_project
  ip_cidr_range            = var.k8s_subnet_cidr
  region                   = var.k8s_region
  network                  = google_compute_network.vpc.id
  private_ip_google_access = true
  secondary_ip_range {
    ip_cidr_range = var.k8s_pod_cidr
    range_name    = var.k8s_pod_cidr_name
  }
  secondary_ip_range {
    ip_cidr_range = var.k8s_svc_cidr
    range_name    = var.k8s_svc_cidr_name
  }
}

# Routing for VPC for pulling images and updates
resource "google_compute_router" "router" {
  name    = "router"
  project = var.k8s_project
  region  = var.k8s_region
  network = google_compute_network.vpc.id
}

# NAT for pulling images and updates
resource "google_compute_router_nat" "nat" {
  name    = "k8s-nat"
  project = var.k8s_project
  region  = var.k8s_region
  router  = google_compute_router.router.name

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.nat.self_link]
}

# NAT for pulling images and updates
resource "google_compute_address" "nat" {
  name         = "k8s-nat"
  address_type = var.k8s_address_type
  network_tier = var.k8s_network_tier
  project      = var.k8s_project
  region       = var.k8s_region
  depends_on   = [google_project_service.compute]
}

# Firewall for external access
resource "google_compute_firewall" "firewall" {
  name    = "firewall"
  network = google_compute_network.vpc.name
  project = var.k8s_project
  allow {
    protocol = "tcp"
    ports    = var.k8s_firewall_ports_allow
  }

  source_ranges = var.k8s_firewall_source_ranges
}

data "google_client_config" "client_config" {}

data "google_container_cluster" "my_cluster" {
  name     = var.k8s_cluster_name
  location = var.k8s_cluster_location
  project  = var.k8s_project
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
}

# The container Cluster 

resource "google_container_cluster" "cluster" {
  provider                 = google-beta
  project                  = var.k8s_project
  name                     = var.k8s_cluster_name
  location                 = var.k8s_cluster_location
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.vpc.self_link
  subnetwork               = google_compute_subnetwork.subnet.self_link
  logging_service          = var.k8s_cluster_logging_service
  monitoring_service       = var.k8s_cluster_monitoring_service
  networking_mode          = "VPC_NATIVE"
  node_locations           = var.k8s_additional_node_zones
  min_master_version       = "1.26.7-gke.500"
  monitoring_config {
    managed_prometheus {
      enabled = var.k8s_enable_managed_prometheus_monitoring
    }
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = format("%s%s", var.k8s_project, ".svc.id.goog")
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.k8s_pod_cidr_name
    services_secondary_range_name = var.k8s_svc_cidr_name
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = var.k8s_master_ipv4_cidr_block
  }

  #   Jenkins use case
  #   master_authorized_networks_config {
  #     cidr_blocks {
  #       cidr_block   = "10.0.0.0/18"
  #       display_name = "private-subnet-w-jenkins"
  #     }
  #   }

  network_policy {
    enabled  = true
    provider = "CALICO"
  }

}

resource "google_service_account" "kubernetes_service_account" {
  account_id = var.k8s_service_account_name
  project    = var.k8s_project
}

resource "google_container_node_pool" "general" {
  name               = "general"
  cluster            = google_container_cluster.cluster.id
  initial_node_count = var.k8s_tier_node_count
  version            = var.k8s_cluster_node_pool_version
  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = var.k8s_tier_node_count
    max_node_count = 100
  }

  node_config {
    preemptible  = false
    machine_type = var.k8s_tier
    labels = {
      role = "general"
    }


    service_account = google_service_account.kubernetes_service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

resource "google_container_node_pool" "spot" {
  name               = "spot"
  cluster            = google_container_cluster.cluster.id
  initial_node_count = var.k8s_spot_tier_node_count
  project            = var.k8s_project
  location           = var.k8s_cluster_location
  version            = var.k8s_cluster_node_pool_version

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = var.k8s_spot_tier_node_count
    max_node_count = 100
  }

  node_config {
    preemptible  = true
    machine_type = var.k8s_spot_tier

    labels = {
      team = "spot"
    }

    #    taint {
    #      key    = "instance_type"
    #      value  = "spot"
    #      effect = "NO_SCHEDULE"
    #    }

    service_account = google_service_account.kubernetes_service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
