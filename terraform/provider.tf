# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  backend "s3" {
  endpoint   = "storage.yandexcloud.net"
  bucket     = "netology-diploma"
  region     = "ru-central"
  key        = "netology-diploma/terraform.tfstate"
# $ yc iam access-key create --service-account-name terraform
  access_key = "YCAJEj4EWiz9FHBZwhnlXbm-_" # key_id:
  secret_key = "YCP3-Fy5Ja0NwwCrT13AnDkEgMY5bj6U3M4i7u-E" # secret:

  skip_region_validation      = true
  skip_credentials_validation = true
  }
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
}
