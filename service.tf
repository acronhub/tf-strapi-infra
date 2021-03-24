# Cloud Run Admin API
resource "google_project_service" "cloud-run" {
  project = var.project_name
  service = "run.googleapis.com"

  disable_dependent_services = true
}

# Cloud SQL Admin API
resource "google_project_service" "cloud-sql" {
  project = var.project_name
  service = "sqladmin.googleapis.com"

  disable_dependent_services = true
}