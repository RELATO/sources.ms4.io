
output "declare -a IPS" {
  value = "( ${digitalocean_droplet.node1.ipv4_address} ${digitalocean_droplet.node2.ipv4_address} ${digitalocean_droplet.node3.ipv4_address} ${digitalocean_droplet.etcd1.ipv4_address} ${digitalocean_droplet.etcd2.ipv4_address} ${digitalocean_droplet.etcd3.ipv4_address} ${digitalocean_droplet.worker1.ipv4_address} ${digitalocean_droplet.worker2.ipv4_address} ${digitalocean_droplet.worker3.ipv4_address} )" 
}

output "Public ip-node1" {
  value = "${digitalocean_droplet.node1.ipv4_address}"
}
output "Public ip-node2" {
  value = "${digitalocean_droplet.node2.ipv4_address}"
}
output "Public ip-node3" {
  value = "${digitalocean_droplet.node3.ipv4_address}"
}
output "Public ip-etcd1" {
  value = "${digitalocean_droplet.etcd1.ipv4_address}"
}
output "Public ip-etcd2" {
  value = "${digitalocean_droplet.etcd2.ipv4_address}"
}
output "Public ip-etcd3" {
  value = "${digitalocean_droplet.etcd3.ipv4_address}"
}
output "Public ip-work1" {
  value = "${digitalocean_droplet.worker1.ipv4_address}"
}
output "Public ip-work2" {
  value = "${digitalocean_droplet.worker2.ipv4_address}"
}
output "Public ip-work3" {
  value = "${digitalocean_droplet.worker3.ipv4_address}"
}
resource "digitalocean_domain" "rkems4io" {
  name       = "rke.ms4.io"
  ip_address = "${digitalocean_droplet.node2.ipv4_address}"
}

output "Private ip-node1" {
  value = "${digitalocean_droplet.node1.ipv4_address_private}"
}
output "Private ip-node2" {
  value = "${digitalocean_droplet.node2.ipv4_address_private}"
}
output "Private ip-node3" {
  value = "${digitalocean_droplet.node3.ipv4_address_private}"
}
output "Private ip-etcd1" {
  value = "${digitalocean_droplet.etcd1.ipv4_address_private}"
}
output "Private ip-etcd2" {
  value = "${digitalocean_droplet.etcd2.ipv4_address_private}"
}
output "Private ip-etcd3" {
  value = "${digitalocean_droplet.etcd3.ipv4_address_private}"
}
output "Private ip-work1" {
  value = "${digitalocean_droplet.worker1.ipv4_address_private}"
}
output "Private ip-work2" {
  value = "${digitalocean_droplet.worker2.ipv4_address_private}"
}
output "Private ip-work3" {
  value = "${digitalocean_droplet.worker3.ipv4_address_private}"
}
output "Name" {
  value = "${digitalocean_droplet.node1.name}"
}
