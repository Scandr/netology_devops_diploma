# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
#  endpoint   = "storage.yandexcloud.net"
#  endpoints.s3  = "storage.yandexcloud.net"
  endpoints = {
    s3 = "https://storage.yandexcloud.net"
  }
  bucket     = "netology-diploma"
  region     = "ru-central1"
  key        = "netology-diploma/terraform.tfstate"
# $ yc iam access-key create --service-account-name terraform
#  access_key = "" # key_id:
#  secret_key = "" # secret:

  use_path_style = true
  skip_region_validation = true
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_requesting_account_id = true
  skip_s3_checksum = true
  }
}

provider "yandex" {
  zone = "ru-central1-b"
#  token =
  service_account_key_file = "/opt/yandex_cloud/key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
}
