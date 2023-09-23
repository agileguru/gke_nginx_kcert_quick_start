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
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_address.reserved_static_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [helm_release.nginx_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nginx_controller_chart"></a> [nginx\_controller\_chart](#input\_nginx\_controller\_chart) | The helm chart | `string` | `"ingress-nginx"` | no |
| <a name="input_nginx_controller_chart_version"></a> [nginx\_controller\_chart\_version](#input\_nginx\_controller\_chart\_version) | The helm chart version | `string` | `"4.6.0"` | no |
| <a name="input_nginx_controller_helm_host"></a> [nginx\_controller\_helm\_host](#input\_nginx\_controller\_helm\_host) | The endpoint of the k8s cluster | `string` | n/a | yes |
| <a name="input_nginx_controller_helm_token"></a> [nginx\_controller\_helm\_token](#input\_nginx\_controller\_helm\_token) | The token of the k8s cluster | `string` | n/a | yes |
| <a name="input_nginx_controller_k8s_cluster_ca_cert"></a> [nginx\_controller\_k8s\_cluster\_ca\_cert](#input\_nginx\_controller\_k8s\_cluster\_ca\_cert) | The CA certificate of the k8s cluster | `string` | n/a | yes |
| <a name="input_nginx_controller_k8s_project"></a> [nginx\_controller\_k8s\_project](#input\_nginx\_controller\_k8s\_project) | The Project where the k8s cluster is installed | `string` | n/a | yes |
| <a name="input_nginx_controller_project"></a> [nginx\_controller\_project](#input\_nginx\_controller\_project) | The project | `string` | n/a | yes |
| <a name="input_nginx_controller_region"></a> [nginx\_controller\_region](#input\_nginx\_controller\_region) | The region | `string` | n/a | yes |
| <a name="input_nginx_controller_repository"></a> [nginx\_controller\_repository](#input\_nginx\_controller\_repository) | The helm repository | `string` | `"https://kubernetes.github.io/ingress-nginx"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_k8s_nginx_controller_lb_ip"></a> [k8s\_nginx\_controller\_lb\_ip](#output\_k8s\_nginx\_controller\_lb\_ip) | n/a |
<!-- END_TF_DOCS -->