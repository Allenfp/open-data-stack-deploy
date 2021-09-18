output "airbyte_sa_key" {
  value     = google_service_account_key.airbyte_sa_key.private_key
  sensitive = true
}

output "metabase_sa_key" {
  value     = google_service_account_key.metabase_sa_key.private_key
  sensitive = true
}

output "prefect_dbt_sa_key" {
  value     = google_service_account_key.prefect_dbt_sa_key.private_key
  sensitive = true
}


