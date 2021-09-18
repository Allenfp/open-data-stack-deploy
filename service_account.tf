# Bigquery Owner
resource "google_service_account" "bq_owner" {
  account_id = "bq-owner"
  project    = var.project_id
  depends_on = [
    google_project.data_project,
  ]
}

# Airbyte service account
resource "google_service_account" "airbyte_sa" {
  account_id   = "airbyte"
  project      = var.project_id
  display_name = "Airbyte Service Account"
  description  = "Airbyte service account"
  depends_on = [
    google_project.data_project,
  ]
}
# Airbyte service account key
resource "google_service_account_key" "airbyte_sa_key" {
  service_account_id = google_service_account.airbyte_sa.name
  public_key_type    = "TYPE_X509_PEM_FILE"
  depends_on = [
    google_project.data_project,
  ]
}

# Metabase service account
resource "google_service_account" "metabase_sa" {
  account_id   = "metabase"
  project      = var.project_id
  display_name = "Metabase Service Account"
  description  = "Metabase service account"
  depends_on = [
    google_project.data_project,
  ]
}
# Metabase service account key
resource "google_service_account_key" "metabase_sa_key" {
  service_account_id = google_service_account.metabase_sa.name
  public_key_type    = "TYPE_X509_PEM_FILE"
  depends_on = [
    google_project.data_project,
  ]
}

# Prefect / DBT service account
resource "google_service_account" "prefect_dbt_sa" {
  account_id   = "prefect-dbt"
  project      = var.project_id
  display_name = "Prefect DBT Service Account"
  description  = "Prefect DBT service account"
  depends_on = [
    google_project.data_project,
  ]
}
# Prefect DBT service account key
resource "google_service_account_key" "prefect_dbt_sa_key" {
  service_account_id = google_service_account.prefect_dbt_sa.name
  public_key_type    = "TYPE_X509_PEM_FILE"
  depends_on = [
    google_project.data_project,
  ]
}


