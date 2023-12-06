resource "yandex_compute_disk" "nfs-disk" {
  name       = "nfs-disk"
  type       = "network-hdd"
  zone       = "ru-central1-b"
  size       = 20
  block_size = 4096
}
