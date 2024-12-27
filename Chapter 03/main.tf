resource "google_storage_bucket" "bucket" {
  name          = "my-bucket"
  location      = "US"
  storage_class = "STANDARD"

  # This is a preferred way to start a single line comment

  // This is another, less common way to start a single-line comment

  /* This is 
a multi-line
comment */
}

resource "google_compute_instance" "web_server" {
  name         = "web-server"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }
  network_interface {
    network = "default"
  }
}
