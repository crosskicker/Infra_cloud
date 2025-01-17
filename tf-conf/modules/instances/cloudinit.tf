terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.7.1" # Vérifiez la version souhaitée
    }
  }
}
provider "libvirt" {
  alias = "local"
  uri = "qemu:///system"
}

provider "libvirt" {
  alias = "remote"
  uri   = "qemu+ssh://cross@192.168.1.177/system"
}
data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}


resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "commoninit-${var.name}.iso"
  user_data = data.template_file.user_data.rendered
}
