resource "libvirt_domain" "instance" {
  name   = var.name
  memory = var.memory
  vcpu   = var.cpu

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

