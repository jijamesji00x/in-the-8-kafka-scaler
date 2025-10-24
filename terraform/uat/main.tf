/*
 * Copyright 2025 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
terraform {
  backend "gcs" {
    bucket = "terraform-state-in-the-8ight-uat"
    prefix = "worker"
  }
}

module "kafka-auto-scaler" {
  # Use relative path for local module or remote source like Git for shared module
  source = "../module/kafka-auto-scaler" # Example if running from within the terraform/ directory

  # --- Required Variables (Values based on your environment) ---
  project_id             = var.project_id
  project_name           = var.project_name
  environment            = var.environment
  region                 = var.region
  zone                   = var.zone
  consumer_sa_email      = var.consumer_sa_email
  consumer_group_id      = var.consumer_group_id
  cloud_tasks_queue_name = var.cloud_tasks_queue_name
  scaler_service_name    = var.scaler_service_name
  scaler_image_path      = var.scaler_image_path

  # --- Optional Inputs (uncomment and customize as needed – each of these has a default) ---

  # VPC Access (Requires existing network/subnet)
  network = var.network
  subnet  = var.subnet

  # Timing & Naming
  # scaler_cycle_seconds          = 120
  scheduler_schedule         = var.scheduler_schedule
  tasks_service_account_name = var.tasks_service_account_name
  # scaler_sa_name_prefix         = "prod-"
  # scheduler_sa_name_prefix      = "prod-"

  # Labels & Versions
  # additional_labels             = { environment = "production", component = "kafka-scaler" }
  # scaler_config_secret_version  = "5"
  # admin_client_secret_version   = "2"

  # Roles & Protection
  # grant_managed_kafka_client_role = true
}
