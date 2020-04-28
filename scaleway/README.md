# README.md

## Updated info

> main.tf
```
# Configure the Scaleway Provider
provider "scaleway" {
  access_key      = var.scw_access_key
  organization_id = var.scw_org
  secret_key      = var.scw_token
  region          = var.region
  zone            = var.zone
}

variable "scw_access_key" {}

variable "scw_org" {}

variable "scw_token" {}

variable "prefix" {
  default = "yourname"
}

variable "rancher_version" {
  default = "latest"
}

variable "admin_password" {
  default = "admin"
}

variable "region" {
  default = "ams1"
}

variable "zone" {
  default = "nl-ams-1"
}

variable "docker_version_server" {
  default = "19.03"
}

variable "type" {
  default = "ARM64-2GB"
}

variable "server_url" {}

resource "scaleway_instance_server" "server" {
  image             = "4b0926bc-5fbe-4187-8557-9228b15e8c09"
  type              = var.type
  name              = "${var.prefix}-server"
  security_group_id = scaleway_instance_security_group.allowall.id
  enable_dynamic_ip = true
  root_volume {
    size_in_gb            = 20
    delete_on_termination = false
  }
}

resource "scaleway_instance_security_group" "allowall" {
  name        = "server-allowall"
  description = "allow all traffic"

  inbound_rule {
    action   = "accept"
    ip_range = "0.0.0.0/0"
    protocol = "TCP"
  }
}

output "rancher-url" {
  value = ["https://${scaleway_instance_server.server.public_ip}"]
}
```
> terraform.tfvars
```
# Scaleway Access Key
scw_access_key = "**************"

# Scaleway Token
scw_token = "xxx-yyy-zzz-www"

# Scaleway Organization ID
scw_org = "xxx-yyy-zzz-www"

# Rancher Server URL
rancher_server_url = "http://rancher.example.com"

# Admin password to access Rancher
admin_password = "xxxxxxxxxxxx"

# Resources will be prefixed with this to avoid clashing names
prefix = "teste"

# rancher/rancher image tag to use
rancher_version = "latest"

# Region where resources should be created
region = "ams1"

# Zone where resources should be created
zone = "nl-ams-1"

# Docker version of host running `rancher/rancher`
docker_version_server = "19.03"

# Scaleway instance type
type = "ARM64-2GB"

```
