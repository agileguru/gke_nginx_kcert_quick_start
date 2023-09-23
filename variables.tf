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

variable "environment_vpc_name" {
  type        = map(string)
  description = "VPC Name Like devops-k8s-vpc"
  default = {
    "devops" = "devops-k8s-vpc"
  }
}

variable "environment_tier" {
  type        = map(string)
  description = "Default Pool Instance Type Like e2-standard-2"
  default = {
    "devops" = "e2-standard-2"
  }
}

variable "environment_spot_tier" {
  type        = map(string)
  description = "Stop Pool Instance Type Like e2-standard-2"
  default = {
    "devops" = "e2-standard-2"
  }
}

variable "environment_subnet_name" {
  type        = map(string)
  description = "The cluster subnet name like devops-k8s-subnet"
  default = {
    "devops" = "devops-k8s-subnet"
  }
}

variable "environment_subnet_cidr" {
  type        = map(string)
  description = "The Cluster subnet CIDR Like 10.0.0.0/18"
  default = {
    "devops" = "10.0.0.0/18"
  }
}

variable "environment_pod_cidr" {
  type        = map(string)
  description = "The Cluster POD Cidr Like 10.48.0.0/14"
  default = {
    "devops" = "10.48.0.0/14"
  }
}

variable "environment_pod_cidr_name" {
  type        = map(string)
  description = "The Cluster POD CIDR Name Like devops-k8s-pod-cidr"
  default = {
    "devops" = "devops-k8s-pod-cidr"
  }
}

variable "environment_svc_cidr" {
  type        = map(string)
  description = "The Cluster Service CIDR Like 10.52.0.0/20"
  default = {
    "devops" = "10.52.0.0/20"
  }
}

variable "environment_svc_cidr_name" {
  type        = map(string)
  description = "The Cluster Service CIDR Name Like devops-k8s-svc-cidr"
  default = {
    "devops" = "devops-k8s-svc-cidr"
  }
}

variable "environment_master_ipv4_cidr_block" {
  type        = map(string)
  description = "The master IPV4 CIDR Block like 172.16.0.0/28"
  default = {
    "devops" = "172.16.0.0/28"
  }
}
