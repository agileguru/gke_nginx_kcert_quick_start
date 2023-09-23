variable "project" {
  type        = string
  description = "The project ID"
}

variable "region" {
  type        = string
  description = "The region where this infra will be created"
}

variable "zone" {
  type        = string
  description = "The Default Availability Zone where this infra will be created"
}

variable "cluster_version" {
  type        = string
  description = "The version of the Cluster"
}

variable "cluster_name" {
  type        = string
  description = "The Name of the Cluster"
}

variable "letsencrypt_email" {
  type        = string
  description = "The Email For acceptance"
}

variable "vpc_name" {
  type        = string
  description = "VPC Name Like devops-k8s-vpc"
}

variable "tier" {
  type        = string
  description = "Default Pool Instance Type Like e2-standard-2"
}

variable "spot_tier" {
  type        = string
  description = "Stop Pool Instance Type Like e2-standard-2"
}

variable "subnet_name" {
  type        = string
  description = "The cluster subnet name like devops-k8s-subnet"
}

variable "subnet_cidr" {
  type        = string
  description = "The Cluster subnet CIDR Like 10.0.0.0/18"
}

variable "pod_cidr" {
  type        = string
  description = "The Cluster POD Cidr Like 10.48.0.0/14"
}

variable "pod_cidr_name" {
  type        = string
  description = "The Cluster POD CIDR Name Like devops-k8s-pod-cidr"
}

variable "svc_cidr" {
  type        = string
  description = "The Cluster Service CIDR Like 10.52.0.0/20"
}

variable "svc_cidr_name" {
  type        = string
  description = "The Cluster Service CIDR Name Like devops-k8s-svc-cidr"
}

variable "master_ipv4_cidr_block" {
  type        = string
  description = "The master IPV4 CIDR Block like 172.16.0.0/28"
}
