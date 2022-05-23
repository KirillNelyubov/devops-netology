provider "yandex" {
  token     = var.yandex_token
  cloud_id  = "b1gpvkvq1p3nlvg66tkf"
#  folder_id = "b1gj0hus3fud83e9kr7v"
  zone      = "ru-central1-a"
}

module "vpc" {
  source  = "hamnsk/vpc/yandex"
  version = "0.5.0"
  description = "managed by terraform"
  create_folder = length(var.yc_folder_id) > 0 ? false : true
  name = terraform.workspace
  subnets = local.vpc_subnets[terraform.workspace]
}

locals {
  instances_count_map = {
    "stage" = 0
    "prod" = 1
  }
}

resource "yandex_storage_bucket" "test" {
  access_key = var.key_id
  secret_key = var.key
  bucket = "mybucket"
}

resource "yandex_compute_instance" "vm-1" {
  name = "terraform1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82re2tpfl4chaupeuf"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}