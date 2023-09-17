# GKE NGINX KCERT Quick Start

A repository for a production grade GKE cluster with nginx and kcert LetsEncrypt SSL certificate manager 

## Assumptions 

1. You have a public DNS for your website
1. Use are using nignx ingress controller
1. You are using kcert SSL manager for your public Site

## Terraform IAC for creating the resources

1. Clone this repository and change to the checkout directory
1. Change the project / region / zone name in variables.tf 
1. Change other variables if needed.

    * > terraform init
    * > terraform apply

> Outputs:
>
> devops_k8s_nginx_controller_lb_ip = "104.154.118.189"

## Setup DNS for the provided IP address

Setup a A record for your domain / sub domain with the IP provisioned

