
output "declare -a IPS" {
  value = "( ${scaleway_server.node1.public_ip} ${scaleway_server.node2.public_ip} ${scaleway_server.node3.public_ip} ${scaleway_server.etcd1.public_ip} ${scaleway_server.etcd2.public_ip} ${scaleway_server.etcd3.public_ip} ${scaleway_server.worker1.public_ip} ${scaleway_server.worker2.public_ip} ${scaleway_server.worker3.public_ip} )" 
}

output "Public ip-node1" {
  value = "${scaleway_server.node1.public_ip}"
}
output "Public ip-node2" {
  value = "${scaleway_server.node2.public_ip}"
}
output "Public ip-node3" {
  value = "${scaleway_server.node3.public_ip}"
}
output "Public ip-etcd1" {
  value = "${scaleway_server.etcd1.public_ip}"
}
output "Public ip-etcd2" {
  value = "${scaleway_server.etcd2.public_ip}"
}
output "Public ip-etcd3" {
  value = "${scaleway_server.etcd3.public_ip}"
}
output "Public ip-work1" {
  value = "${scaleway_server.worker1.public_ip}"
}
output "Public ip-work2" {
  value = "${scaleway_server.worker2.public_ip}"
}
output "Public ip-work3" {
  value = "${scaleway_server.worker3.public_ip}"
}

