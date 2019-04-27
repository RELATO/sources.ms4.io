#creating ssh_key
resource "vultr_ssh_key" "terraform_infra" {
        name = "terraform_infra"
        public_key = "${file("${var.pub_key}")}"
}

resource "vultr_instance" "node1" {
  name              = "node1"
  region_id         = "${data.vultr_region.region.id}"
  plan_id           = "${data.vultr_plan.plan.id}"
  os_id             = "${data.vultr_os.os.id}"
  hostname          = "${var.instance_name}"
  ssh_key_ids       = ["${vultr_ssh_key.terraform_infra.id}"]
  # ssh_key_ids = [
  #   "${var.ssh_fingerprint}",
  # ]
  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout     = "2m"
  }
  provisioner "file" {
    source      = "${path.root}/hack/bootstrap.sh"
    destination = "/root/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = "/bin/bash /root/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "sudo adduser centos",
        "echo -e \"1q2w3e4r*\n1q2w3e4r*\" | passwd centos",
        "echo -e \"1q2w3e4r*\n1q2w3e4r*\" | sudo passwd root",
        "sudo mkdir -p /home/centos/.ssh",
        "sudo touch /home/centos/.ssh/authorized_keys",
        "sudo cat /root/.ssh/authorized_keys >> /home/centos/.ssh/authorized_keys",
        "sudo chown -R centos:centos /home/centos/.ssh",
        "sudo chmod 700 /home/centos/.ssh",
        "sudo chmod 600 /home/centos/.ssh/authorized_keys",
        "sudo usermod -aG wheel centos"
    ]
  }
}
resource "vultr_instance" "node2" {
  name              = "node2"
  region_id         = "${data.vultr_region.region.id}"
  plan_id           = "${data.vultr_plan.plan.id}"
  os_id             = "${data.vultr_os.os.id}"
  hostname          = "${var.instance_name}"
  ssh_key_ids       = ["${vultr_ssh_key.terraform_infra.id}"]
  # ssh_key_ids = [
  #   "${var.ssh_fingerprint}",
  # ]
  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout     = "2m"
  }
  provisioner "file" {
    source      = "${path.root}/hack/bootstrap.sh"
    destination = "/root/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = "/bin/bash /root/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "sudo adduser centos",
	"echo -e \"1q2w3e4r*\n1q2w3e4r*\" | passwd centos",
        "echo -e \"1q2w3e4r*\n1q2w3e4r*\" | sudo passwd root",
        "sudo mkdir -p /home/centos/.ssh",
        "sudo touch /home/centos/.ssh/authorized_keys",
        "sudo cat /root/.ssh/authorized_keys >> /home/centos/.ssh/authorized_keys",
        "sudo chown -R centos:centos /home/centos/.ssh",
        "sudo chmod 700 /home/centos/.ssh",
        "sudo chmod 600 /home/centos/.ssh/authorized_keys",
        "sudo usermod -aG wheel centos"
    ]
  }
}
resource "vultr_instance" "node3" {
  name              = "node3"
  region_id         = "${data.vultr_region.region.id}"
  plan_id           = "${data.vultr_plan.plan.id}"
  os_id             = "${data.vultr_os.os.id}"
  hostname          = "${var.instance_name}"
  ssh_key_ids       = ["${vultr_ssh_key.terraform_infra.id}"]
  # ssh_key_ids = [
  #   "${var.ssh_fingerprint}",
  # ]
  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout     = "2m"
  }
  provisioner "file" {
    source      = "${path.root}/hack/bootstrap.sh"
    destination = "/root/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = "/bin/bash /root/bootstrap.sh"
  }
  provisioner "remote-exec" {
    inline = [
        "sudo adduser centos",
        "echo -e \"1q2w3e4r*\n1q2w3e4r*\" | passwd centos",
        "echo -e \"1q2w3e4r*\n1q2w3e4r*\" | sudo passwd root",
        "sudo mkdir -p /home/centos/.ssh",
        "sudo touch /home/centos/.ssh/authorized_keys",
        "sudo cat /root/.ssh/authorized_keys >> /home/centos/.ssh/authorized_keys",
        "sudo chown -R centos:centos /home/centos/.ssh",
        "sudo chmod 700 /home/centos/.ssh",
        "sudo chmod 600 /home/centos/.ssh/authorized_keys",
        "sudo usermod -aG wheel centos"
    ]
  }
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
    values = ["${var.os_version}"]
  }
}

data "vultr_plan" "plan" {
  filter {
    name   = "price_per_month"
    values = ["${var.plan[0]}"]
  }

  filter {
    name   = "ram"
    values = ["${var.plan[1]}"]
  }
}
# only using ssh_key
# data "vultr_ssh_key" "squat" {
#   filter {
#     name   = "name"
#     values = ["terraform_infra"]
#   }
# }

