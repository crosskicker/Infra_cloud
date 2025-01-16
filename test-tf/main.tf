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


module "instance1" {
  source    = "./modules/instances"
  name      = var.instance1.name
  providers = {
    libvirt = libvirt.local
  }
}

module "instance2" {
  source    = "./modules/instances"
  name      = var.instance2.name
  cpu       = var.instance2.cpu
  memory    = var.instance2.memory
  providers = {
    libvirt = libvirt.local
  }
}

module "remote_instance1" {
  source    = "./modules/instances"
  providers = {
    libvirt = libvirt.remote
  }
  name = "remote_vm1"
  cpu  = 2
  memory = 2048
}
