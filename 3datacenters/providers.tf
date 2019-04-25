resource "digitalocean_droplet" "dgo-host" {
  name               = "${format(var.dgo-hostname_format, count.index + 1)}"
  region             = "${var.dgo-region}"
  image              = "${var.dgo-image}"
  size               = "${var.dgo-size}"
  backups            = false
  private_networking = true
  ssh_keys           = "${var.ssh_keys}"

  count = "${var.hosts}"

  provisioner "remote-exec" {
    inline = [
      "until [ -f /var/lib/cloud/instance/boot-finished ]; do sleep 1; done",
      "apt-get update",
      "apt-get install -yq ufw ${join(" ", var.apt_packages)}",
    ]
  }
}

output "dgo-hostnames" {
  value = ["${digitalocean_droplet.dgo-host.*.name}"]
}

output "dgo-public_ips" {
  value = ["${digitalocean_droplet.dgo-host.*.ipv4_address}"]
}

provider "scaleway" {
  organization = "${var.organization}"
  token        = "${var.token}"
  region       = "${var.region}"
}

resource "scaleway_server" "scw-host" {
  name                = "${format(var.hostname_format, count.index + 1)}"
  type                = "${var.type}"
  image               = "${data.scaleway_image.scw-image.id}"
  bootscript          = "${data.scaleway_bootscript.scw-bootscript.id}"
  dynamic_ip_required = true

  count = "${var.hosts}"

  # volume = {
  #   size_in_gb = "${var.storage_size}"
  #   type       = "l_ssd"
  # }

  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt-get install -yq apt-transport-https ufw ${join(" ", var.apt_packages)}",
    ]
  }
}

data "scaleway_image" "scw-image" {
  architecture = "x86_64"
  name         = "${var.scw-image}"
}

data "scaleway_bootscript" "scw-bootscript" {
  architecture = "x86_64"
  name_filter  = "mainline 4.15.11 rev1"
}

output "scw-hostnames" {
  value = ["${scaleway_server.scw-host.*.name}"]
}

output "scw-public_ips" {
  value = ["${scaleway_server.scw-host.*.public_ip}"]
}

