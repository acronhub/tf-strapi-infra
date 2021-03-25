# GCPインフラ構成 Terraform

GCPに環境を構築

- API Service
- IAM
- Cloud SQL
- Cloud Storage

## 必要環境

- [Docker](https://www.docker.com/docker-mac) をインストール済み

## 事前準備

- サービスアカウントを作成
  - [サービスアカウント]で、[新しいサービスアカウント]を選択します
  - 好きな名前を付けてください
  - ロール
    - 「プロジェクト->エディター」を選択します
    - 「Project IAM 管理者」を選択します
  - 「キータイプ」はJSONのままにします
  - 「作成」をクリックしてキーを作成し、キーファイルをシステムに保存します

- APIを有効
  - [APIとサービス]で、[ライブラリ]を選択します
  - [cloudresourcemanager.googleapis.com]で検索します
  - [有効にする]をクリックして有効にします

- GCP 環境を設定
  ```BASH
  cp -a .env.example .env
  vi .env
  ```

1. 初期化

    ```BASH
    docker-compose run --rm terraform init
    ```

1. tfstateファイルの保存バケットの作成

    ```BASH
    docker-compose run --rm terraform apply
    ```

1. backendの反映

    ```BASH
    vi main.tf
    ```

    ```BASH
    # GCSの作成前はコメントアウト
    # ※環境変数が使えないので直接書く
    #backend "gcs" {
    #  bucket  = "tf-xxxxx-state-store"
    #}
    ```

    ```BASH
    docker-compose run --rm terraform init
    ```

## 実行方法

- プラン作成
  ```BASH
  docker-compose run --rm terraform plan
  ```

- 反映
  ```BASH
  docker-compose run --rm terraform apply
  ```

- terraform.tfstate は GCS で管理しています
- GCP接続鍵 .envは、システム管理者にお問い合わせください