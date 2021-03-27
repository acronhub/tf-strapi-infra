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

variable "domain" {
  type    = string
  default = "<your-domain>"
  description = " 取得しているドメイン"
}