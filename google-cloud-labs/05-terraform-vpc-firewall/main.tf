terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

variable "project_id" {
  description = "Google Cloud project ID used for the lab."
  type        = string
}

variable "region" {
  description = "Google Cloud region for the VPC resources."
  type        = string
  default     = "us-central1"
}

locals {
  name_suffix = "lab5"
}

resource "google_compute_network" "test_network" {
  name                    = "test-network-${local.name_suffix}"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "test_firewall" {
  name    = "test-firewall-${local.name_suffix}"
  network = google_compute_network.test_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }
}

output "network_name" {
  value = google_compute_network.test_network.name
}

output "firewall_name" {
  value = google_compute_firewall.test_firewall.name
}
