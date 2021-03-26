resource "google_storage_bucket" "strapi" {
  name     = "strapi-resources"
  location = var.region
  storage_class = "REGIONAL"
}