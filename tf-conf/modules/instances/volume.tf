resource "libvirt_volume" "ubuntu-qcow2" {
  name = "ubuntu-${var.name}.qcow2"
  pool = "default"
  source = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  format = "qcow2"
}

resource "libvirt_volume" "disk" {
  name            = "vm-disk-${var.name}"
  base_volume_id  = libvirt_volume.ubuntu-qcow2.id
  pool            = "default"
  size            = var.disk_size
}