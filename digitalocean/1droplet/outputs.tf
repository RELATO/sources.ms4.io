output "Public ip-node1" {
  value = "${digitalocean_droplet.node1.ipv4_address}"
}
output "Name" {
  value = "${digitalocean_droplet.node1.name}"
}
