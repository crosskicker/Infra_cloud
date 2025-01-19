variable "name" {}
variable "cpu" {
    type    = string
    default = 2
}
variable "memory" {
    type    = string
    default = 2048
}
variable "mac"{}
variable "net_mode"{}

# Taille du disque en octets
variable "disk_size" {
    default = 10737418240
}