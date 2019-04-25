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

variable "docker_version" {
  default     = "18.06"
  description = <<EOT

Specify the docker version either as

  - Simplified 5 characters name such as:
    - 17.03
    - 18.06

  - The exact release name such as:
    - 17.03.0~ce-0~ubuntu-xenial
    - 18.06.0~ce~3-0~ubuntu

EOT
}

variable "k8s_version" {
  default = "stable-1.13"
}

variable "weave_passwd" {
  default = "1q2w3e4r*"
}

variable "arch" {
  default     = "x86_64"
  description = "Values: arm arm64 x86_64"
}

variable "region" {
  default     = "par1"
  description = "Values: par1 ams1"
}

variable "server_type" {
  default     = "GP1-XS"
  description = "Use C1 for arm, ARM64-2GB for arm64 and C2S for x86_64"
}

variable "server_type_node" {
  default     = "GP1-XS"
  description = "Use C1 for arm, ARM64-2GB for arm64 and C2S for x86_64"
}

variable "nodes" {
  default = 1
}

variable "ip_admin" {
  type        = "list"
  default     = ["0.0.0.0/0"]
  description = "IP access to services"
}

variable "private_key" {
  type        = "string"
  default     = "~/.ssh/id_rsa"
  description = "The path to your private key"
}

variable "container_log_max_size" {
  default     = "100Mi"
  description = "The maximum file size for container logs, k8s 1.12+ only"
}

variable "kubeadm_verbosity" {
  default     = "0"
  description = "The verbosity level of the kubeadm init logs"
}

variable "kubelet_extra_args" {
  default = ""
  description = "Extra arguments used by kubelet systemd"
}

variable "ssh_fingerprint" {
  default = ""
}

variable "ssh_public_key" {
  description = "SSH public key to be copied on machines"
  default = ".ssh/id_rsa.pub"
}

variable "ssh_private_key" {
  description = "SSH private key to be used to log into machines"
  default = ".ssh/id_rsa"
}
