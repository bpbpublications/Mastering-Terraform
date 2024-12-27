resource "google_compute_instance" "example_instance" {
  name         = "example-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

provider "google" {
  project = "my-gcp-project"
  region  = "us-central1"
}

resource "google_storage_bucket" "bucket" {
  name          = "my-bucket"
  location      = "US"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
}
