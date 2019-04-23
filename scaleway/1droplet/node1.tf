resource "scaleway_ip" "node_ip" {
  count = "${var.nodes}"
}

resource "scaleway_server" "node" {
  count          = "${var.nodes}"
  name           = "${terraform.workspace}-node-${count.index + 1}"
  image          = "${data.scaleway_image.ubuntu.id}"
  type           = "${var.server_type_node}"
  public_ip      = "${element(scaleway_ip.node_ip.*.ip, count.index)}"
  security_group = "${scaleway_security_group.node_security_group.id}"

  connection {
    type        = "ssh"
    user        = "root"
    private_key = "${file(var.private_key)}"
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
