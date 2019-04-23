resource "digitalocean_droplet" "etcd3" {
  # Obtain your ssh_key id number via your account. See Document https://developers.digitalocean.com/documentation/v2/#list-all-keys
  name               = "etcd3"
  ssh_keys           = [24374236]         # Key id
#  ssh_keys           =  '["${var.digitalocean_ssh_key.dokey.id}"]'
  image              = "${var.ubuntu}"
  region             = "${var.do_nyc1}"
  size               = "s-1vcpu-1gb"
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

resource "digitalocean_record" "etcd3dnsname" {
  domain = "${digitalocean_domain.rkems4io.name}"
  type   = "A"
  name   = "etcd3"
  value  = "${digitalocean_droplet.etcd3.ipv4_address}"
}
