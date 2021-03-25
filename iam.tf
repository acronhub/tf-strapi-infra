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


# GCR,CloudRun(GithubActions) サービスアカウント
resource "google_service_account" "github-actions" {
  account_id   = "github-actions"
  display_name = "github-actions"
  description  = "GithubActionsからGCR,CloudRunにデプロイ"
}

resource "google_project_iam_member" "github-actions-cloudrun" {
  role   = "roles/run.admin"
  member = "serviceAccount:${google_service_account.github-actions.email}"
}
resource "google_project_iam_member" "github-actions-storage" {
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.github-actions.email}"
}
resource "google_project_iam_member" "github-actions-serviceAccountUser" {
  role   = "roles/iam.serviceAccountUser"
  member = "serviceAccount:${google_service_account.github-actions.email}"
}

# 鍵作成
resource "google_service_account_key" "github-actions" {
  service_account_id = google_service_account.github-actions.name
  public_key_type = "TYPE_X509_PEM_FILE"
}
