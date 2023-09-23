variable "environment_project" {
  type        = map(string)
  description = "The Association of Projects and Environment names"
  default = {
    "devops" = "guru-playground",
  }
}

variable "environment_region" {
  type        = map(string)
  description = "The Association of Regions and Environments"
  default = {
    "devops" = "us-central1"
  }
}

variable "environment_zone" {
  type        = map(string)
  description = "The Association of Zones and Environments"
  default = {
    "devops" = "us-central1-a"
  }
}

variable "environment_k8s_version" {
  type        = map(string)
  description = "The Association of k8s version and Environments"
  default = {
    "devops" = "1.27.4-gke.900"
  }
}

variable "environment_letsencrypt_email" {
  type        = map(string)
  description = "The Association of Letsencrypt Email and Environments"
  default = {
    "devops" = "webtechguru@gmail.com"
  }
}

variable "environment_cluster_name" {
  type        = map(string)
  description = "The Association of Cluster Name and Environments"
  default = {
    "devops" = "devops-k8s-cluster"
  }
}
