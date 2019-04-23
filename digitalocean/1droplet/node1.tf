resource "digitalocean_droplet" "node1" {
  # Obtain your ssh_key id number via your account. See Document https://developers.digitalocean.com/documentation/v2/#list-all-keys
  name               = "node1"
  ssh_keys           = [24374236]         # Key id
#  ssh_keys           =  '["${var.digitalocean_ssh_key.dokey.id}"]'
  image              = "${var.ubuntu}"
  region             = "${var.do_nyc1}"
  size               = "s-2vcpu-2gb"
  private_networking = true
  backups            = true
  ipv6               = true

  connection {
    type     = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    user     = "root"
    timeout  = "2m"
  }

  provisioner "file" {
    source      = "${path.module}/hack/bootstrap.sh"
    destination = "/root/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = "/bin/bash /root/bootstrap.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "useradd -m -G docker rke",
      "echo -e \"1q2w3e4r*\n1q2w3e4r*\" | passwd rke",
      "echo -e \"1q2w3e4r*\n1q2w3e4r*\" | sudo passwd root",
      "sudo mkdir -p /home/rke/.ssh",
      "sudo touch /home/rke/.ssh/authorized_keys",
      "sudo cat /root/.ssh/authorized_keys >> /home/rke/.ssh/authorized_keys",
      "sudo chown -R rke:rke /home/rke/.ssh",
      "sudo chmod 700 /home/rke/.ssh",
      "sudo chmod 600 /home/rke/.ssh/authorized_keys",
      "sudo usermod -aG sudo rke"
    ]

  }
}




resource rke_cluster "cluster" {
  nodes {
      address = "${digitalocean_droplet.node1.ipv4_address}"
      user    = "rke"
      internal_address = "${digitalocean_droplet.node1.ipv4_address_private}"
      role    = ["controlplane", "worker", "etcd"]
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
