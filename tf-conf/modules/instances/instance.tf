resource "libvirt_domain" "instance" {
  name   = var.name
  memory = var.memory
  vcpu   = var.cpu

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_name = var.net_mode
    mac = var.mac
    /* wait_for_lease = "true" */
  }

  disk {
    volume_id = libvirt_volume.disk.id
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

