<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.82.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.82.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.11.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.23.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_devops"></a> [devops](#module\_devops) | ./environments/devops | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment_cluster_name"></a> [environment\_cluster\_name](#input\_environment\_cluster\_name) | The Association of Cluster Name and Environments | `map(string)` | <pre>{<br>  "devops": "devops-k8s-cluster"<br>}</pre> | no |
| <a name="input_environment_k8s_version"></a> [environment\_k8s\_version](#input\_environment\_k8s\_version) | The Association of k8s version and Environments | `map(string)` | <pre>{<br>  "devops": "1.27.4-gke.900"<br>}</pre> | no |
| <a name="input_environment_letsencrypt_email"></a> [environment\_letsencrypt\_email](#input\_environment\_letsencrypt\_email) | The Association of Letsencrypt Email and Environments | `map(string)` | <pre>{<br>  "devops": "webtechguru@gmail.com"<br>}</pre> | no |
| <a name="input_environment_master_ipv4_cidr_block"></a> [environment\_master\_ipv4\_cidr\_block](#input\_environment\_master\_ipv4\_cidr\_block) | The master IPV4 CIDR Block like 172.16.0.0/28 | `map(string)` | <pre>{<br>  "devops": "172.16.0.0/28"<br>}</pre> | no |
| <a name="input_environment_pod_cidr"></a> [environment\_pod\_cidr](#input\_environment\_pod\_cidr) | The Cluster POD Cidr Like 10.48.0.0/14 | `map(string)` | <pre>{<br>  "devops": "10.48.0.0/14"<br>}</pre> | no |
| <a name="input_environment_pod_cidr_name"></a> [environment\_pod\_cidr\_name](#input\_environment\_pod\_cidr\_name) | The Cluster POD CIDR Name Like devops-k8s-pod-cidr | `map(string)` | <pre>{<br>  "devops": "devops-k8s-pod-cidr"<br>}</pre> | no |
| <a name="input_environment_project"></a> [environment\_project](#input\_environment\_project) | The Association of Projects and Environment names | `map(string)` | <pre>{<br>  "devops": "guru-playground"<br>}</pre> | no |
| <a name="input_environment_region"></a> [environment\_region](#input\_environment\_region) | The Association of Regions and Environments | `map(string)` | <pre>{<br>  "devops": "us-central1"<br>}</pre> | no |
| <a name="input_environment_spot_tier"></a> [environment\_spot\_tier](#input\_environment\_spot\_tier) | Stop Pool Instance Type Like e2-standard-2 | `map(string)` | <pre>{<br>  "devops": "e2-standard-2"<br>}</pre> | no |
| <a name="input_environment_subnet_cidr"></a> [environment\_subnet\_cidr](#input\_environment\_subnet\_cidr) | The Cluster subnet CIDR Like 10.0.0.0/18 | `map(string)` | <pre>{<br>  "devops": "10.0.0.0/18"<br>}</pre> | no |
| <a name="input_environment_subnet_name"></a> [environment\_subnet\_name](#input\_environment\_subnet\_name) | The cluster subnet name like devops-k8s-subnet | `map(string)` | <pre>{<br>  "devops": "devops-k8s-subnet"<br>}</pre> | no |
| <a name="input_environment_svc_cidr"></a> [environment\_svc\_cidr](#input\_environment\_svc\_cidr) | The Cluster Service CIDR Like 10.52.0.0/20 | `map(string)` | <pre>{<br>  "devops": "10.52.0.0/20"<br>}</pre> | no |
| <a name="input_environment_svc_cidr_name"></a> [environment\_svc\_cidr\_name](#input\_environment\_svc\_cidr\_name) | The Cluster Service CIDR Name Like devops-k8s-svc-cidr | `map(string)` | <pre>{<br>  "devops": "devops-k8s-svc-cidr"<br>}</pre> | no |
| <a name="input_environment_tier"></a> [environment\_tier](#input\_environment\_tier) | Default Pool Instance Type Like e2-standard-2 | `map(string)` | <pre>{<br>  "devops": "e2-standard-2"<br>}</pre> | no |
| <a name="input_environment_vpc_name"></a> [environment\_vpc\_name](#input\_environment\_vpc\_name) | VPC Name Like devops-k8s-vpc | `map(string)` | <pre>{<br>  "devops": "devops-k8s-vpc"<br>}</pre> | no |
| <a name="input_environment_zone"></a> [environment\_zone](#input\_environment\_zone) | The Association of Zones and Environments | `map(string)` | <pre>{<br>  "devops": "us-central1-a"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_devops_k8s_nginx_controller_lb_ip"></a> [devops\_k8s\_nginx\_controller\_lb\_ip](#output\_devops\_k8s\_nginx\_controller\_lb\_ip) | n/a |
<!-- END_TF_DOCS -->