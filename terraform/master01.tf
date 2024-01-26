resource "yandex_compute_instance" "master01" {
  name                      = "master01"
  zone                      = "ru-central1-b"
  hostname                  = "master01.netology.yc"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 5
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.os_destrib}"
      name        = "root-master01"
      type        = "network-nvme"
      size        = "50"
    }
  }
  secondary_disk {
    disk_id = yandex_compute_disk.nfs-disk.id
    auto_delete = true
    device_name = "nfs"
    }
#  network_interface {
#    subnet_id  = "${yandex_vpc_subnet.netology-subnet-a.id}"
#    nat        = true
#    ip_address = "192.168.10.10"
#  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.netology-subnet-b.id}"
    nat        = true
    ip_address = "192.168.20.20"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("/opt/yandex_cloud/id_rsa.pub")}"
  }
}
