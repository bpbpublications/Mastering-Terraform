terraform {
  backend "gcs" {
    bucket = "my-2024-tf-state"
    prefix = "terraform/state"
  }
}

resource "google_storage_bucket" "example-bucket" {
  name          = "tf-xample-bucket"
  location      = "ASIA1"
  force_destroy = true
}

resource "google_storage_bucket" "example-bucket-renamed" {
  name          = "tf-xample-bucket"
  location      = "ASIA1"
  force_destroy = true
}

import {
  id = "{{project_id}}/{{bucket}}"
  to = google_storage_bucket.default
}
