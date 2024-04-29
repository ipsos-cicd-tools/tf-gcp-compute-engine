output "internal_ip" {
  value = google_compute_instance.default.network_interface[0].network_ip
}

output "id" {
  value = google_compute_instance.default.instance_id
}

output "name" {
  value = google_compute_instance.default.name
}

output "boot_disk_name" {
  value = google_compute_disk.boot-disk.name
}

output "additional_disks" {
  value = { for k, v in google_compute_disk.additional_disks : k => {
    project  = v.project
    zone     = v.zone
    disk     = v.name
    instance = google_compute_instance.default.name
  } }
}

output "zone" {
  value = google_compute_instance.default.zone
}

output "self_link" {
  value = google_compute_instance.default.self_link
}