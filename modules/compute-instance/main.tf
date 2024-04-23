resource "google_compute_instance" "default" {
  name                      = format("%s", var.instance_name)
  machine_type              = var.machine_type
  zone                      = var.gcp_zone
  labels                    = var.labels
  allow_stopping_for_update = true

  boot_disk {
    source      = google_compute_disk.boot-disk.name
    auto_delete = true
  }

  network_interface {
    subnetwork = var.subnet
  }

  tags = var.tags

  dynamic "attached_disk" {
    for_each = var.disk_config
    content {
      source      = google_compute_disk.additional_disks[attached_disk.key].self_link
      device_name = google_compute_disk.additional_disks[attached_disk.key].name
    }
  }

  resource_policies = var.resource_policy

  metadata_startup_script = var.startup_script

  metadata = var.metadata

  dynamic "service_account" {
    for_each = var.service_account != null ? [var.service_account] : []
    content {
      email  = service_account.value.email != null ? service_account.value.email : ""
      scopes = service_account.value.scopes != null ? service_account.value.scopes : []
    }
  }

  lifecycle {
    ignore_changes = [
      metadata["windows-keys"],
      metadata["ssh-keys"]
    ]
  }
}


resource "google_compute_disk" "boot-disk" {
  name   = format("%s-%s", var.instance_name, "boot-disk")
  type   = var.os_disk_type
  image  = var.image
  labels = var.labels
  size   = var.os_disk_size
  zone   = var.gcp_zone

  lifecycle {
    ignore_changes = [
      image,
      snapshot
    ]
  }
}

resource "google_compute_disk" "additional_disks" {
  for_each = var.disk_config
  project  = var.project_id
  name     = format("%s-%s", var.instance_name, each.key)
  zone     = var.gcp_zone
  type     = each.value["type"]
  size     = each.value["size"]
}