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
  uri   = "qemu+ssh://cross@91.169.37.232/system?no_verify=1"
}

/* si je suis connecté au réseau local (rezowifi1) : 192.168.1.169
sinon 91.169.37.232 */

variable "instance1" {
  type = map
  default = {
    name = "instance1"
    mac = "52:54:00:AA:8C:03"
    net_mode = "default"
  }
}

variable "instance2" {
  type = map
  default = {
    name = "instance2"
    cpu       = 2
    memory    = 2048
    mac= "52:54:00:BA:95:E6"
    net_mode = "default"
  }
}


module "instance1" {
  source    = "./modules/instances"
  name      = var.instance1.name
  mac = var.instance1.mac
  net_mode = var.instance1.net_mode
  providers = {
    libvirt = libvirt.local
  }
}

module "instance2" {
  source    = "./modules/instances"
  name      = var.instance2.name
  cpu       = var.instance2.cpu
  memory    = var.instance2.memory
  mac = var.instance2.mac
  net_mode = var.instance2.net_mode
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
  mac= "52:54:00:AB:65:F5"
  net_mode = "br-test"
}

module "remote_instance2" {
  source    = "./modules/instances"
  providers = {
    libvirt = libvirt.remote
  }
  name = "remote_vm2"
  cpu  = 2
  memory = 2048
  mac= "52:54:00:AE:75:F9"
  net_mode = "br-test"
}