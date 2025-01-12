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
data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}


resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "commoninit-${var.name}.iso"
  user_data = data.template_file.user_data.rendered
}
