variable "hosts" {
  default = "3"
}


variable "digitalocean_token" {
  description = "talocean token"
}

variable "dgo_ubuntu" {
  description = "Default LTS"
  default     = "ubuntu-16-04-x64"
}

variable "dgo_centos" {
  description = "Default Centos"
  default     = "centos-72-x64"
}

variable "dgo_coreos" {
  description = "Defaut Coreos"
  default     = "coreos-899.17.0"
}

variable "do_nyc1" {
  description = "Digital Ocean New York Data Center 1"
  default     = "nyc1"
}
variable "do_ams3" {
  description = "Digital Ocean Amsterdam Data Center 3"
  default     = "ams3"
}
variable "dgo_size" {
  type = "string"
  default = "s-2vcpu-2gb"
}

variable "dgo-apt_packages" {
  type    = "list"
  default = []
}

variable "dgo_ssh_keys" {
  type    = "list"
  default = [24374236] # Key id
}



variable "scaleway_token" {
  type = "string"
}
variable "scaleway_organization" {
  type = "string"
}
variable "scaleway_region" {
  type = "string"
}
variable "scw_type" {
  type = "string"
  default = "START1-S"
}

variable "scw-apt_packages" {
  type    = "list"
  default = []
}


variable "ubuntu_version" {
  default = "Ubuntu Xenial"
  description = <<EOT
For arm, choose from:
  - Ubuntu Xenial
For x86_64, choose from:
  - Ubuntu Xenial
  - Ubuntu Bionic
Notes:
  - kubernetes only has xenial packages for debian
  - currently arm is not working with ubuntu bionic (kubeadm init hangs)
EOT
}

variable "arch" {
  default     = "x86_64"
  description = "Values: arm arm64 x86_64"
}

variable "vultr_api_key" {}

variable "vultr_instance_name" {
    default = "node"
}
variable "vultr_region"  {
  default = "Amsterdam"
}
variable "vultr_os_version"  {
  default = "Ubuntu 16.04 x64"
}
variable "vultr_plan"  {
  type = "list"
  // [price, ram ]
  default = ["20.00","4096"]
}

variable "public_key" {
  type        = "string"
  default     = "~/.ssh/id_rsa.pub"
  description = "The path to your public key"
}

variable "private_key" {
  type        = "string"
  default     = "~/.ssh/id_rsa"
  description = "The path to your private key"
}

