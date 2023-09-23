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

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.82.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | >= 4.82.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_container_cluster.cluster](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_cluster) | resource |
| [google_compute_address.nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_firewall.firewall](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_router.router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_container_node_pool.general](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_container_node_pool.spot](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_project_service.compute](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.container](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.kubernetes_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_client_config.client_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_container_cluster.my_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/container_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_k8s_additional_node_zones"></a> [k8s\_additional\_node\_zones](#input\_k8s\_additional\_node\_zones) | The Additional zones GKE instance | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_k8s_address_type"></a> [k8s\_address\_type](#input\_k8s\_address\_type) | The address type for GKE instance | `string` | `"EXTERNAL"` | no |
| <a name="input_k8s_cluster_location"></a> [k8s\_cluster\_location](#input\_k8s\_cluster\_location) | The Region or zone of the GKE instance | `string` | n/a | yes |
| <a name="input_k8s_cluster_name"></a> [k8s\_cluster\_name](#input\_k8s\_cluster\_name) | The name of the GKE instance | `string` | n/a | yes |
| <a name="input_k8s_cluster_node_pool_version"></a> [k8s\_cluster\_node\_pool\_version](#input\_k8s\_cluster\_node\_pool\_version) | Cluster And Node Pool Version | `string` | n/a | yes |
| <a name="input_k8s_enable_managed_prometheus_monitoring"></a> [k8s\_enable\_managed\_prometheus\_monitoring](#input\_k8s\_enable\_managed\_prometheus\_monitoring) | Enable Managed Prometheus Monitoring | `bool` | `true` | no |
| <a name="input_k8s_firewall_ports_allow"></a> [k8s\_firewall\_ports\_allow](#input\_k8s\_firewall\_ports\_allow) | The ports opened by GKE instance | `list(string)` | <pre>[<br>  "22"<br>]</pre> | no |
| <a name="input_k8s_firewall_source_ranges"></a> [k8s\_firewall\_source\_ranges](#input\_k8s\_firewall\_source\_ranges) | The Source IP to allow GKE instance | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_k8s_master_ipv4_cidr_block"></a> [k8s\_master\_ipv4\_cidr\_block](#input\_k8s\_master\_ipv4\_cidr\_block) | The cidr BLOCK for master GKE instance | `string` | n/a | yes |
| <a name="input_k8s_network_tier"></a> [k8s\_network\_tier](#input\_k8s\_network\_tier) | The network Tier for GKE instance | `string` | `"PREMIUM"` | no |
| <a name="input_k8s_pod_cidr"></a> [k8s\_pod\_cidr](#input\_k8s\_pod\_cidr) | The CIDR of the POD for this GKE instance | `string` | n/a | yes |
| <a name="input_k8s_pod_cidr_name"></a> [k8s\_pod\_cidr\_name](#input\_k8s\_pod\_cidr\_name) | The CIDR Name of the POD for this GKE instance | `string` | n/a | yes |
| <a name="input_k8s_project"></a> [k8s\_project](#input\_k8s\_project) | The Project of the GKE instance | `string` | n/a | yes |
| <a name="input_k8s_region"></a> [k8s\_region](#input\_k8s\_region) | The Region of the GKE instance | `string` | `"us-central1"` | no |
| <a name="input_k8s_service_account_name"></a> [k8s\_service\_account\_name](#input\_k8s\_service\_account\_name) | The Service Account name GKE instance | `string` | n/a | yes |
| <a name="input_k8s_spot_tier"></a> [k8s\_spot\_tier](#input\_k8s\_spot\_tier) | The instance tiers are based on the machine | `string` | `"e2-f1-micro"` | no |
| <a name="input_k8s_spot_tier_node_count"></a> [k8s\_spot\_tier\_node\_count](#input\_k8s\_spot\_tier\_node\_count) | The nodes in this pool | `number` | `2` | no |
| <a name="input_k8s_subnet_cidr"></a> [k8s\_subnet\_cidr](#input\_k8s\_subnet\_cidr) | The CIDR of the VPC SUBNET for this GKE instance | `string` | n/a | yes |
| <a name="input_k8s_subnet_name"></a> [k8s\_subnet\_name](#input\_k8s\_subnet\_name) | The Name of the VPC SUBNET for this GKE instance | `string` | n/a | yes |
| <a name="input_k8s_svc_cidr"></a> [k8s\_svc\_cidr](#input\_k8s\_svc\_cidr) | The CIDR of the SVC for this GKE instance | `string` | n/a | yes |
| <a name="input_k8s_svc_cidr_name"></a> [k8s\_svc\_cidr\_name](#input\_k8s\_svc\_cidr\_name) | The CIDR Name of the SVC for this GKE instance | `string` | n/a | yes |
| <a name="input_k8s_tier"></a> [k8s\_tier](#input\_k8s\_tier) | The instance tiers are based on the machine | `string` | `"e2-f1-micro"` | no |
| <a name="input_k8s_tier_node_count"></a> [k8s\_tier\_node\_count](#input\_k8s\_tier\_node\_count) | The nodes in this pool | `string` | `2` | no |
| <a name="input_k8s_vpc_name"></a> [k8s\_vpc\_name](#input\_k8s\_vpc\_name) | The Name of the VPC for this GKE instance | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_k8s_project_cluster_cluster_ca_cert"></a> [k8s\_project\_cluster\_cluster\_ca\_cert](#output\_k8s\_project\_cluster\_cluster\_ca\_cert) | n/a |
| <a name="output_k8s_project_cluster_endpoint"></a> [k8s\_project\_cluster\_endpoint](#output\_k8s\_project\_cluster\_endpoint) | n/a |
| <a name="output_k8s_project_cluster_token"></a> [k8s\_project\_cluster\_token](#output\_k8s\_project\_cluster\_token) | n/a |
<!-- END_TF_DOCS -->