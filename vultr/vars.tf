variable "vultr_api_key" {}
variable "pub_key" {
  default     = "~/.ssh/id_rsa.pub"
}
variable "pvt_key" {
  default     = "~/.ssh/id_rsa"
}
variable "ssh_fingerprint" {
  default = "00"
}
variable "instance_name" {
    default = "node"
}
variable "vultr_region"  {
  default = "Miami"
}
variable "os_version"  {
  default = "CentOS 7 x64"
}
variable "plan"  {
  type = "list"
  // [price, ram ]
  default = ["20.00","4096"]
}
