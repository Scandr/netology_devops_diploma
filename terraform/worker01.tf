resource "yandex_compute_instance" "worker01" {
  name                      = "worker01"
  zone                      = "ru-central1-b"
  hostname                  = "worker01.netology.yc"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.os_destrib}"
      name        = "root-worker01"
      type        = "network-nvme"
      size        = "50"
    }
  }

#  network_interface {
#    subnet_id  = "${yandex_vpc_subnet.netology-subnet-a.id}"
#    nat        = true
#    ip_address = "192.168.10.11"
#  }
  network_interface {
    subnet_id  = "${yandex_vpc_subnet.netology-subnet-b.id}"
    nat        = true
    ip_address = "192.168.20.21"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("/opt/yandex_cloud/id_rsa.pub")}"
  }
}
