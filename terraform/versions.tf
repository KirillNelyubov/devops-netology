terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "mybucket>"
    region     = "ru-central1"
    key        = "mybucket.tfstate"
    access_key = var.key_id
    secret_key = var.key

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
