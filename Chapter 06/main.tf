resource "google_compute_instance" "example" {
  name         = "example-instance"
  machine_type = "e2-medium"
  zone         = "asia-northeast1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_instance" "example" {
  // other configuration
  lifecycle {
    precondition {
      condition     = data.google.compute_instance.example.boot_disk.initialize_params.type > "pd-ssd"
      error_message = "The selected boot disk must be of pd-ssd type."
    }
  }
}

resource "google_service_account" "example" {
  account_id   = "example-service-account"
  display_name = "Example Service Account"
}

resource "google_project_iam_member" "example" {
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.example.email}"
  // other configuration

}

resource "google_compute_instance" "server" {
  count        = 3
  name         = "server-${count.index}"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}

variable "server_names" {
  type    = set(string)
  default = ["web", "app", "db"]
}

resource "google_compute_instance" "server" {
  for_each     = var.server_names
  name         = "server-${each.key}"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}

provider "google" {
  alias   = "europe"
  project = "europe-project"
  region  = "europe-west1"
}

resource "google_compute_instance" "pre-tf-example" {
  name         = "pre-tf-example"
  machine_type = "e2-micro"
  zone         = "asia-northeast1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_instance" "example" {
  name         = "example-instance"
  machine_type = "e2-medium"
  zone         = "asia-northeast1"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_instance" "example_1" {
  name         = "example-1-instance"
  machine_type = "e2-medium"
  zone         = "asia-northeast1"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_disk" "example" {
  name = "example-disk"
  zone = google_compute_instance.example.zone
  size = 10
}

data "google_compute_image" "example" {
  family  = "debian-9"
  project = "debian-cloud"
}

import {
  id = "projects/our-example-project/zones/asia-northeast1-a/instances/pre-tf-example"
  to = google_compute_instance.name_for_newly_imported_example
}
