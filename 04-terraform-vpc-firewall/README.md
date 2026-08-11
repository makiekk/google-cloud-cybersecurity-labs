# Lab 5 — Terraform VPC Network & Firewall

## Overview

This lab demonstrates how to use Terraform to provision Google Cloud network infrastructure for the Cymbal Bank application.

## Objectives

- Clone and inspect a Terraform configuration in Cloud Shell.
- Initialize Terraform and deploy infrastructure as code.
- Provision a VPC network.
- Configure a firewall rule allowing ICMP and selected TCP ports.
- Verify the deployed network and firewall configuration in Google Cloud.

## Infrastructure

Terraform provisions:

- VPC network: `test-network-lab5`
- Firewall rule: `test-firewall-lab5`
- ICMP traffic
- TCP port `80`
- TCP port `8080`
- TCP ports `1000-2000`

## Deployment commands

```bash
export GOOGLE_CLOUD_PROJECT=PROJECT_ID
terraform init
terraform apply
```

Approve the deployment with `yes` when prompted.

Expected successful deployment:

```text
Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
```

## Security relevance

This exercise demonstrates infrastructure-as-code for network security controls. Firewall rules are defined declaratively, making network policy repeatable, reviewable, and less dependent on manual configuration.

## Validation

The deployment was verified in Google Cloud under **VPC network → VPC networks → Firewalls**, confirming the configured ICMP and TCP rules.

> Lab environment note: Do not commit Terraform state files, credentials, service-account keys, or other secrets to this repository.
