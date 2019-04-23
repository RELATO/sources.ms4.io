
resource rke_cluster "cluster" {
  nodes {
      address = "${digitalocean_droplet.node1.ipv4_address}"
      user    = "rke"
      internal_address = "${digitalocean_droplet.node1.ipv4_address_private}"
      role    = ["controlplane", "worker"]
  }
  nodes {
      address = "${digitalocean_droplet.node2.ipv4_address}"
      user    = "rke"
      internal_address = "${digitalocean_droplet.node2.ipv4_address_private}"
      role    = ["controlplane", "worker"]
  }
  nodes {
      address = "${digitalocean_droplet.node3.ipv4_address}"
      user    = "rke"
      internal_address = "${digitalocean_droplet.node3.ipv4_address_private}"
      role    = ["controlplane", "worker"]
  }
  nodes {
      address = "${digitalocean_droplet.worker1.ipv4_address}"
      user    = "rke"
      internal_address = "${digitalocean_droplet.worker1.ipv4_address_private}"
      role    = ["worker"]
  }
  nodes {
      address = "${digitalocean_droplet.worker2.ipv4_address}"
      user    = "rke"
      internal_address = "${digitalocean_droplet.worker2.ipv4_address_private}"
      role    = ["worker"]
  }
  nodes {
      address = "${digitalocean_droplet.worker3.ipv4_address}"
      user    = "rke"
      internal_address = "${digitalocean_droplet.worker3.ipv4_address_private}"
      role    = ["worker"]
  }
  nodes {
      address = "${digitalocean_droplet.etcd1.ipv4_address}"
      user    = "rke"
      internal_address = "${digitalocean_droplet.etcd1.ipv4_address_private}"
      role    = ["etcd"]
  }
  nodes {
      address = "${digitalocean_droplet.etcd2.ipv4_address}"
      user    = "rke"
      internal_address = "${digitalocean_droplet.etcd2.ipv4_address_private}"
      role    = ["etcd"]
  }
  nodes {
      address = "${digitalocean_droplet.etcd3.ipv4_address}"
      user    = "rke"
      internal_address = "${digitalocean_droplet.etcd3.ipv4_address_private}"
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
