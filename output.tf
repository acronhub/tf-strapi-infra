# プロジェクト情報
output "GCP_PROJECT" {
  value = var.project_name
}
output "GCP_REGION" {
  value = var.region
}

# サービスアカウント情報
output "GCP_SA_EMAIL" {
  value = google_service_account.github-actions.email
}
output "GCP_SA_KEY" {
  value = google_service_account_key.github-actions.private_key
}
output "GCP_CLOUDRUN_SA" {
  value = google_service_account.cloud-run-sa.email
}

# CloudSQL情報
output "GCP_CLOUDSQL_INSTANCES" {
  value = google_sql_database_instance.strapi.connection_name
}
output "GCP_DATABASE_NAME" {
  value = google_sql_database.strapi.name
}
output "GCP_DATABASE_USERNAME" {
  value = google_sql_user.strapi.name
}
output "GCP_DATABASE_PASSWORD" {
  value = google_sql_user.strapi.password
}

