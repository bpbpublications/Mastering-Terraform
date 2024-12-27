
resource "google_compute_instance" "example" {
  name         = "example-instance"
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


terraform {
  required_providers {
    myGoogleProvider = {
      source = "hashicorp/google"
    version = ">= 6.12.0" }
  }
}

provider "myGoogleProvider" {
  project = "example-project"
  region  = "us-central1"
}

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
