terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.1" # Vérifiez la version souhaitée
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}
resource "libvirt_volume" "ubuntu-qcow2" {
  name = "ubuntu.qcow2"
  pool = "default"
  source = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  format = "qcow2"
}

data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "commoninit.iso"
  user_data = data.template_file.user_data.rendered
}


resource "libvirt_domain" "myvm" {
  name   = "myvm"
  memory = "1024"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.commoninit.id 

  network_interface {
    network_name = "default"
    wait_for_lease = "true"
  }
  disk {
    volume_id = libvirt_volume.ubuntu-qcow2.id
  }
  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }
  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}
output "ip" {
  value = libvirt_domain.myvm.network_interface.0.addresses.0
}
