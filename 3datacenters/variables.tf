variable "hosts" {
  default = "3"
}

variable "dgo-hostname_format" {
  type = "string"
}

variable "dgo-region" {
  type = "string"
}

variable "dgo-type" {
  type = "string"
}

variable "dgo-size" {
  type = "string"
}

variable "dgo-image" {
  type = "string"
}

variable "dgo-apt_packages" {
  type    = "list"
  default = []
}

variable "dgo-ssh-keys" {
  type    = "list"
  default = []
}



variable "scw-token" {
  type = "string"
}
variable "scw-organization" {
  type = "string"
}
variable "scw-hostname_format" {
  type = "string"
}

variable "scw-region" {
  type = "string"
}

variable "scw-type" {
  type = "string"
}

variable "scw-image" {
  type = "string"
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
    default = "vultrnode"
}
variable "vultr_region"  {
  default = "Amsterdam"
}
variable "vultr_os_version"  {
  default = "Ubuntu 18.04 x64"
}
variable "vultr_plan"  {
  type = "list"
  // [price, ram ]
  default = ["5.00","1024"]
}


variable "ssh_keys" {
  type        = "string"
  default     = "~/.ssh/id_rsa.pub"
  description = "The path to your public key"
}

variable "private_key" {
  type        = "string"
  default     = "~/.ssh/id_rsa"
  description = "The path to your private key"
}

