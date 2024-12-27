output "db_password" {
  value     = var.db_password
  sensitive = true
}

data "google_secret_manager_secret_version" "db_password" {
  secret  = "my-db-admin-password"
  version = "1"
}

resource "google_sql_database_instance" "main_db" {
  name             = "my-instance"
  database_version = "POSTGRES_14"
  root_password    = data.google_secret_manager_secret_version.db_password.secret
}
