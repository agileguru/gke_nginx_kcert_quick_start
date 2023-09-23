variable "project" {
  description = "The project ID"
}

variable "region" {
  description = "The region where this infra will be created"
}

variable "zone" {
  description = "The Default Availability Zone where this infra will be created"
}

variable "cluster_version" {
  description = "The version of the Cluster"
}

variable "cluster_name" {
  description = "The Name of the Cluster"
}

variable "letsencrypt_email" {
  description = "The Email For acceptance"
}
