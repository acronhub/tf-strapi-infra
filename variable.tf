variable "project_name" {
  type    = string
  default = "<your-project>"
  description = "GCP プロジェクトID"
}

variable "region" {
  type    = string
  default = "<your-project>"
  description = "GCP リージョン"
}

variable "credential" {
  type    = string
  default = "<your-credential-path>"
  description = "GCP サービスアカウントJSONファイル"
}
