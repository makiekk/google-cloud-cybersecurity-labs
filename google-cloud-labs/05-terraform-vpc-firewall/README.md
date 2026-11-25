# Lab 5: Terraform VPC Network and Firewall

## Overview

This lab demonstrates Infrastructure as Code (IaC) by using Terraform to provision Google Cloud network infrastructure for the Cymbal Bank application.

## Objectives

- Inspect a Terraform configuration in Cloud Shell.
- Initialize Terraform.
- Provision a VPC network.
- Configure a firewall rule for ICMP and selected TCP ports.
- Verify the deployed network and firewall configuration.

## Infrastructure

The Terraform configuration provisions:

- VPC network: `test-network-lab5`
- Firewall rule: `test-firewall-lab5`
- ICMP traffic
- TCP port `80`
- TCP port `8080`
- TCP ports `1000-2000`

## Deployment

Set the Google Cloud project and run Terraform:

```bash
export GOOGLE_CLOUD_PROJECT=PROJECT_ID
terraform init
terraform apply
```

Review the execution plan and approve the deployment when prompted.

Expected successful deployment from the lab:

```text
Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
```

## Validation

The deployment was checked in Google Cloud under **VPC network → VPC networks → Firewalls**, confirming the configured network and firewall rules.

## Security Considerations

- Firewall rules should be restricted to the minimum required source ranges and ports.
- Review the Terraform plan before applying infrastructure changes.
- Keep Terraform state files and credentials out of source control.
- Use variables and environment-specific configuration rather than hard-coding sensitive values.

## Files

- `main.tf` – Terraform configuration for the VPC and firewall resources.

## Skills Practiced

Terraform, Infrastructure as Code, Google Cloud provider configuration, VPC provisioning, firewall rules, deployment validation, and cloud network security.
