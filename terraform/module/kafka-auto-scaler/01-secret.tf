## https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret ##
resource "google_secret_manager_secret" "secret_manager_kafka_client_config" {
  project   = var.project_id
  secret_id = "${var.project_name}-${var.environment}-kafka-scaler-client-config"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret" "secret_manager_kafka_scaler_scaling_config" {
  project   = var.project_id
  secret_id = "${var.project_name}-${var.environment}-kafka-scaler-scaling-config"

  replication {
    auto {}
  }
}
