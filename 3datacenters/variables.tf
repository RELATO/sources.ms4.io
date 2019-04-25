variable "hosts" {
  default = "3"
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

variable "private_key" {
  type        = "string"
  default     = "~/.ssh/id_rsa"
  description = "The path to your private key"
}

