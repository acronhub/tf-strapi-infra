resource "google_storage_bucket" "strapi" {
  name     = "strapi-resources.${var.domain}"
  location = var.region
  storage_class = "REGIONAL"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404-error.html"
  }
}

resource "google_storage_bucket_iam_member" "strapi" {
  bucket = google_storage_bucket.strapi.name
  role = "roles/storage.objectViewer"
  member = "allUsers"
}