resource "yandex_compute_instance" "worker02" {
  name                      = "worker02"
  zone                      = "ru-central1-b"
  hostname                  = "worker02.netology.yc"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.os_destrib}"
      name        = "root-worker02"
      type        = "network-nvme"
      size        = "10"
    }
  }

#  network_interface {
#    subnet_id  = "${yandex_vpc_subnet.netology-subnet-a.id}"
#    nat        = true
#    ip_address = "192.168.10.12"
#  }
  network_interface {
    subnet_id  = "${yandex_vpc_subnet.netology-subnet-b.id}"
    nat        = true
    ip_address = "192.168.20.22"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("/opt/yandex_cloud/id_rsa.pub")}"
  }
}
