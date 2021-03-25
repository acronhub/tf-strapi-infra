resource "google_sql_database_instance" "strapi" {
  name             = "strapi"
  database_version = "MYSQL_5_7"
  region           = var.region

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"

    # シングルゾーン
    availability_type = "ZONAL"

    # ストレージ
    disk_size = 10
    disk_type = "PD_SSD"
    disk_autoresize = true

    # バックアップ
    backup_configuration {
      binary_log_enabled = true
      enabled            = true
      start_time         = "14:00" # JST:23:00
    }
  }
}

# DB作成
resource "google_sql_database" "strapi" {
  name      = "strapi"
  instance  = google_sql_database_instance.strapi.name
  charset   = "utf8mb4"
  collation = "utf8mb4_general_ci"
}

# DBユーザ作成
resource "random_password" "strapi-password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "google_sql_user" "strapi" {
  name     = "strapi"
  instance = google_sql_database_instance.strapi.name
  password = random_password.strapi-password.result
}

