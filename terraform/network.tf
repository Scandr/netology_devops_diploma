# Network
resource "yandex_vpc_network" "default" {
  name = "netology-net"
}

resource "yandex_vpc_subnet" "netology-subnet-a" {
  name = "netology-subnet-a"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "netology-subnet-b" {
  name = "netology-subnet-b"
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.default.id}"
  v4_cidr_blocks = ["192.168.20.0/24"]
}
