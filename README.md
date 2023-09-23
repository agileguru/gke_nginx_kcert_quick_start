# GKE NGINX KCERT Quick Start

A repository for a production grade GKE cluster with nginx and kcert LetsEncrypt SSL certificate manager 

## Assumptions 

1. You have a public DNS for your website
1. Use are using nignx ingress controller
1. You are using kcert SSL manager for your public Site

## Tools / CLI to download and put in path

1. Terraform CLI [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)
2. Terraform-docs CLI ( optional ) [https://github.com/terraform-docs/terraform-docs/releases](https://github.com/terraform-docs/terraform-docs/releases)

## Terraform IAC for creating the resources

1. Clone this repository and change to the checkout directory
1. Change the values in sample.tfvars or create a new tfvars with correct values
1. Change other variables if needed to customize the cluster details.
1. Uncomment the backend.tf keys and provide the correct values if using GCS for storing the state. Delete backend.tf to use the local file system for state management.
1. Execute the following .
    * > terraform init
    * > terraform plan -var-file=sample.tfvars ( change sample.tfvars to your specific config file )
    * > terraform apply -var-file=sample.tfvars ( change sample.tfvars to your specific config file )

> Outputs:
>
> devops_k8s_nginx_controller_lb_ip = "104.154.118.189"

## Setup DNS for the provided IP address

Setup a A record for your domain / sub domain with the IP provisioned

