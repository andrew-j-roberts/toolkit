resource "google_compute_instance" "__NODE_PREFIX__-__NODE_NAME__" {
  name         = "__NODE_PREFIX__-__NODE_NAME__"
  machine_type = ""

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }

  metadata = {
    Name     = "__NODE_PREFIX__-__NODE_NAME__"
    ssh-keys = "${var.gcp_ssh_user}:${file("${var.gcp_public_key_path}")}"
  }

  metadata_startup_script = "echo hi > /test.txt"
}
