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
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.kcert_letsencrypt](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kcert_controller_chart"></a> [kcert\_controller\_chart](#input\_kcert\_controller\_chart) | The helm chart | `string` | `"kcert"` | no |
| <a name="input_kcert_controller_chart_version"></a> [kcert\_controller\_chart\_version](#input\_kcert\_controller\_chart\_version) | The helm chart version | `string` | `"1.0.6"` | no |
| <a name="input_kcert_controller_create_namespace"></a> [kcert\_controller\_create\_namespace](#input\_kcert\_controller\_create\_namespace) | Create the namespace | `bool` | `true` | no |
| <a name="input_kcert_controller_namespace"></a> [kcert\_controller\_namespace](#input\_kcert\_controller\_namespace) | The namespace where to install | `string` | `"kcert"` | no |
| <a name="input_kcert_controller_repository"></a> [kcert\_controller\_repository](#input\_kcert\_controller\_repository) | The helm repository | `string` | `"https://nabsul.github.io/helm"` | no |
| <a name="input_kcert_letsencrypt_email"></a> [kcert\_letsencrypt\_email](#input\_kcert\_letsencrypt\_email) | The Email for kcert letsencrypt | `string` | n/a | yes |
| <a name="input_nginx_controller_helm_host"></a> [nginx\_controller\_helm\_host](#input\_nginx\_controller\_helm\_host) | The endpoint of the k8s cluster | `string` | n/a | yes |
| <a name="input_nginx_controller_helm_token"></a> [nginx\_controller\_helm\_token](#input\_nginx\_controller\_helm\_token) | The token of the k8s cluster | `string` | n/a | yes |
| <a name="input_nginx_controller_k8s_cluster_ca_cert"></a> [nginx\_controller\_k8s\_cluster\_ca\_cert](#input\_nginx\_controller\_k8s\_cluster\_ca\_cert) | The CA certificate of the k8s cluster | `string` | n/a | yes |
| <a name="input_nginx_controller_k8s_project"></a> [nginx\_controller\_k8s\_project](#input\_nginx\_controller\_k8s\_project) | The Project where the k8s cluster is installed | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->