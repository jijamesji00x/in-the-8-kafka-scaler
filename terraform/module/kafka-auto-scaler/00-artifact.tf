## https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository ##
resource "google_artifact_registry_repository" "artifact_registry_repository" {
  project       = var.project_id
  location      = var.region
  repository_id = "${var.project_name}-${var.environment}-kafka-scaler"
  description   = "Image repository"
  format        = "DOCKER"
}
