
resource rke_cluster "cluster" {
  nodes {
      address = "${scaleway_server.node1.public_ip}"
      user    = "rke"
      internal_address = "${scaleway_server.node1.private_ip}"
      role    = ["controlplane", "worker"]
  }
  nodes {
      address = "${scaleway_server.node2.public_ip}"
      user    = "rke"
      internal_address = "${scaleway_server.node2.private_ip}"
      role    = ["controlplane", "worker"]
  }
  nodes {
      address = "${scaleway_server.node3.public_ip}"
      user    = "rke"
      internal_address = "${scaleway_server.node3.private_ip}"
      role    = ["controlplane", "worker"]
  }
  nodes {
      address = "${scaleway_server.worker1.public_ip}"
      user    = "rke"
      internal_address = "${scaleway_server.worker1.private_ip}"
      role    = ["worker"]
  }
  nodes {
      address = "${scaleway_server.worker2.public_ip}"
      user    = "rke"
      internal_address = "${scaleway_server.worker2.private_ip}"
      role    = ["worker"]
  }
  nodes {
      address = "${scaleway_server.worker3.public_ip}"
      user    = "rke"
      internal_address = "${scaleway_server.worker3.private_ip}"
      role    = ["worker"]
  }
  nodes {
      address = "${scaleway_server.etcd1.public_ip}"
      user    = "rke"
      internal_address = "${scaleway_server.etcd1.private_ip}"
      role    = ["etcd"]
  }
  nodes {
      address = "${scaleway_server.etcd2.public_ip}"
      user    = "rke"
      internal_address = "${scaleway_server.etcd2.private_ip}"
      role    = ["etcd"]
  }
  nodes {
      address = "${scaleway_server.etcd3.public_ip}"
      user    = "rke"
      internal_address = "${scaleway_server.etcd3.private_ip}"
      role    = ["etcd"]
  }
}

###############################################################################
# If you need kubeconfig.yml for using kubectl, please uncomment follows.
###############################################################################
resource "local_file" "kube_cluster_yaml" {
  filename = "${path.root}/kube_config_cluster.yml"
  content  = "${rke_cluster.cluster.kube_config_yaml} "
}

###############################################################################
# If you need cluster.yml for using rke, please uncomment follows.
###############################################################################
resource "local_file" "rke_cluster_yaml" {
  filename = "${format("%s/%s", path.root, "cluster.yml")}"
  content = "${rke_cluster.cluster.rke_cluster_yaml}"
}

###############################################################################
# You can also use an output.
###############################################################################
output "rke_cluster_yaml" {
  sensitive = true
  value = "${rke_cluster.cluster.rke_cluster_yaml}"
}
