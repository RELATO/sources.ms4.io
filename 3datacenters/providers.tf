provider "digitalocean" {
  token = "${chomp(file("~/.config/digital-ocean/token"))}"  
}

resource "digitalocean_droplet" "dgo-host" {
  count = "${var.hosts}"
  
  #Obtain your ssh_key id number via your account. See Document https://developers.digitalocean.com/documentation/v2/#list-all-keys
  #ssh_keys           =  '["${var.digitalocean_ssh_key.dokey.id}"]'
  ssh_keys           = "${var.dgo_ssh_keys}"
  image              = "${var.dgo_ubuntu}"
  region             = "${var.do_ams3}"
  private_networking = true
  name               = "node${count.index}"
  size               = "${var.dgo_size}"
  backups            = false
  
  connection {
    type     = "ssh"
    private_key = "${file("~/.ssh/id_rsa")}"
    user     = "root"
    timeout  = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "until [ -f /var/lib/cloud/instance/boot-finished ]; do sleep 1; done",
      "apt-get update",
      "apt-get install -yq ufw ${join(" ", var.dgo-apt_packages)}",
    ]
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

output "dgo-hostnames" {
  value = ["${digitalocean_droplet.dgo-host.*.name}"]
}

output "dgo-public_ips" {
  value = ["${digitalocean_droplet.dgo-host.*.ipv4_address}"]
}

data "scaleway_image" "ubuntu" {
  architecture = "${var.arch}"
  name         = "${var.ubuntu_version}"
}
provider "scaleway" {
  organization = "${var.scaleway_organization}"
  token        = "${var.scaleway_token}"
  region       = "${var.scaleway_region}"
}

resource "scaleway_server" "scw-host" {
  
  count = "${var.hosts}"
  name               = "node${count.index}"
  type                = "${var.scw_type}"
  image               = "${data.scaleway_image.ubuntu.id}"
  bootscript          = "${data.scaleway_bootscript.scw-bootscript.id}"
  dynamic_ip_required = true


  # volume = {
  #   size_in_gb = "${var.storage_size}"
  #   type       = "l_ssd"
  # }

  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt-get install -yq apt-transport-https ufw ${join(" ", var.scw_apt_packages)}",
    ]
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

provider "vultr" {
    api_key = "${var.vultr_api_key}"
}

data "vultr_region" "region" {
  filter {
    name   = "name"
    values = ["${var.vultr_region}"]
  }
}

data "vultr_os" "os" {
  filter {
    name   = "name"
    values = ["${var.vultr_os_version}"]
  }
}

data "vultr_plan" "plan" {
  filter {
    name   = "price_per_month"
    values = ["${var.vultr_plan[0]}"]
  }

  filter {
    name   = "ram"
    values = ["${var.vultr_plan[1]}"]
  }
}

#creating ssh_key
resource "vultr_ssh_key" "terraform_infra" {
  name = "terraform_infra"
  public_key = "${file("${var.public_key}")}"
}


// Create a pair of Vultr private networks.
resource "vultr_network" "network" {
  count       = 1
  cidr_block  = "${cidrsubnet("172.16.18.0/24", 1, count.index)}"
  description = "private_network_${count.index}"
  region_id   = "${data.vultr_region.region.id}"
}

resource "vultr_instance" "intance" {
  count = "${var.hosts}"  
  name              = "node${count.index}"
  hostname          = "node${count.index}"
  region_id         = "${data.vultr_region.region.id}"
  plan_id           = "${data.vultr_plan.plan.id}"
  os_id             = "${data.vultr_os.os.id}"
  ssh_key_ids       = ["${vultr_ssh_key.terraform_infra.id}"]
  network_ids = ["${vultr_network.network.*.id}"]
  ipv6        = true

  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file(var.private_key)}"
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt-get install -yq apt-transport-https ufw ${join(" ", var.vultr_apt_packages)}",
    ]
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

output "vtr-hostnames" {
  value = ["${vultr_instance.intance.*.name}"]
}

output "vtr-public_ips" {
  value = ["${vultr_instance.intance.*.ipv4_address}"]
}
