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
  access_key = "" # key_id:
  secret_key = "" # secret:

  skip_region_validation      = true
  skip_credentials_validation = true
  }
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
}
