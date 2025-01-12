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


variable "instance1" {
  type = map
  default = {
    name = "instance1"
  }
}

variable "instance2" {
  type = map
  default = {
    name = "instance2"
    cpu       = 2
    memory    = 2048
  }
}

resource "libvirt_network" "vm_network" {
  name = "vm_network"
  addresses = ["10.0.1.0/24"]
  mode = "nat"
  dhcp {
   enabled = false
  }
}

module "instance1" {
  source    = "./modules/instances"
  name      = var.instance1.name

}

module "instance2" {
  source    = "./modules/instances"
  name      = var.instance2.name
  cpu       = var.instance2.cpu
  memory    = var.instance2.memory
}

