resource "google_compute_instance" "airbyte_instance" {
  name                    = "${var.project_id}-airbyte"
  machine_type            = local.airbyte_machine_type
  project                 = var.project_id
  metadata_startup_script = file("./sh_scripts/airbyte.sh")

  depends_on = [
    google_project_service.data_project_services,
  ]

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20210415"
      size  = 50
      type  = "pd-balanced"
    }
  }
  network_interface {
    network = "default"
    access_config {
      network_tier = "PREMIUM"
    }
  }
}

resource "google_compute_instance" "metabase_instance" {
  name                    = "${var.project_id}-metabase"
  machine_type            = local.metabase_machine_type
  project                 = var.project_id
  metadata_startup_script = file("./sh_scripts/metabase.sh")

  depends_on = [
    google_project_service.data_project_services,
  ]

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20210415"
      size  = 50
      type  = "pd-balanced"
    }
  }
  
  network_interface {
    network = "default"
    access_config {
      network_tier = "PREMIUM"
    }
  }
}

resource "google_compute_instance" "prefect_dbt_instance" {
  name                    = "${var.project_id}-prefect-dbt"
  machine_type            = local.prefect_dbt_machine_type
  project                 = var.project_id
  metadata_startup_script = file("./sh_scripts/prefect_dbt.sh")

  depends_on = [
    google_project_service.data_project_services,
  ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
      size  = 50
      type  = "pd-balanced"
    }
  }

  network_interface {
    network = "default"
    access_config {
      network_tier = "PREMIUM"
    }
  }

  service_account {
    #This must be narrowed for production environment
    scopes = ["cloud-platform"]
    }
}
