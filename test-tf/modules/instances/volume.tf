resource "libvirt_volume" "ubuntu-qcow2" {
  name = "ubuntu-${var.name}.qcow2"
  pool = "default"
  source = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  format = "qcow2"
}