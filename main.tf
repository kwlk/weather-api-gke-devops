terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" 
    }
  }
}

provider "google" {
  project = "group-project-478615"
  region  = "us-central1" 
}

# Sieć VPC 
resource "google_compute_network" "main" {
  name                    = "gke-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "main" {
  name          = "gke-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.main.id
}

# Klaster GKE
resource "google_container_cluster" "primary" {
  name     = "moj-gke-klaster"
  location = "us-central1"

  network    = google_compute_network.main.id
  subnetwork = google_compute_subnetwork.main.name

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {}

# Node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-nodes"
  location   = google_container_cluster.primary.location
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    machine_type = "e2-micro"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
