provider "digitalocean" {
  token = "${chomp(file("~/.config/do/token"))}"
  alias = "default"
}

#resource "digitalocean_ssh_key" "dokey" {
#    name = "dokey"
#    public_key = "${file(".ssh/id_rsa.pub")}"
#}

