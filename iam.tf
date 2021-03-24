# CloudSQLクライアント サービスアカウント
resource "google_service_account" "cloudsql-client" {
  account_id   = "cloudsql-client"
  display_name = "cloudsql-client"
  description  = "CloudSQLクライアント"
}

resource "google_project_iam_member" "cloudsql-client" {
  role   = "roles/cloudsql.client"
  member = "serviceAccount:${google_service_account.cloudsql-client.email}"
}
