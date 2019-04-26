data "scaleway_image" "ubuntu" {
  architecture = "${var.arch}"
  name         = "${var.ubuntu_version}"
}

resource "scaleway_ip" "node_ip" {
  count = "${var.scaleway_node_count}"
}

resource "scaleway_server" "node" {
  count = "${var.scaleway_node_count}"
  name = "node${count.index}"
  public_ip  = "${element(scaleway_ip.node_ip.*.ip, count.index)}"
  image  = "${data.scaleway_image.ubuntu.id}"
  type = "GP1-S"
  tags = [
    "node"]
}

resource "null_resource" "configure-node" {
  count = "${var.scaleway_node_count}"

  connection {
    host  = "${element(scaleway_ip.node_ip.*.ip, count.index)}"
    user  = "root"
    private_key = "${file(var.private_key)}"
    agent = true
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
      "sudo usermod -aG sudo rke",
      "apt-get update",
      "echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections",
      "apt -y -q install sudo jq curl zip unzip screen ",
      "modprobe br_netfilter && echo br_netfilter >> /etc/modules",
    ]
  }
  provisioner "file" {
    source      = "${path.module}/hack/bootstrap.sh"
    destination = "/root/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = "/bin/bash /root/bootstrap.sh"
  }
}
