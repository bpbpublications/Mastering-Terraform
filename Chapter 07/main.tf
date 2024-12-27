

variable "example_var" {
  default     = "default_value"
  description = "An example variable used for demonstration purposes."
  sensitive   = true
  nullable    = false
  validation {
    condition     = length(var.example_var) > 4
    error_message = "The string must be more than 4 characters."
  }
}

output "instance_ip_addr" {
  value = google_compute_instance.server.network_interface[0].network_ip
}


output "database_connection_string" {
  value       = "user:${google_sql_database_instance.db.username}@${google_sql_database_instance.db.public_ip_address}/dbname"
  description = "The connection string for the database."
  sensitive   = true
}

output "instance_zone" {
  value       = google_compute_instance.server.zone
  description = "The zone of the main compute instance."

  depends_on = [
    # Ensure the compute instance is created before its zone is outputted
    google_compute_instance.server,
  ]
}
