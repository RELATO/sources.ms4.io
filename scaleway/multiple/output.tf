
output "node_public_ip" {
  value = "${scaleway_server.node.*.public_ip}"
}

output "node_private_ip" {
  value = "${scaleway_server.node.*.private_ip}"
}

output "node_id" {
  value = "${scaleway_server.node.*.id}"
}
