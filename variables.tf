variable "environment_project" {
  type        = map(string)
  description = "The Association of Projects and Environment names"
  default = {
    "devops" = "devops-353009",
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
    "devops" = "1.26.7-gke.500"
  }
}
