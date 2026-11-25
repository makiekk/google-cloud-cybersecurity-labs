# Google Cloud Labs

This directory is the **single canonical home** for Labs 1–6 in this Google Cloud cybersecurity portfolio. Each lab has its own README with its objective, implementation or investigation steps, outcomes, and skills practiced.

## Lab Index

| Lab | Project | Main services / tools | Documentation status |
|---|---|---|---|
| [Lab 1 – Secure VPC Network](01-secure-vpc-network/README.md) | Build a custom VPC, subnet, and firewall rules | VPC, Cloud Shell, Google Cloud CLI | Documented |
| [Lab 2 – Security Command Center: Security Posture](02-security-command-center-posture/README.md) | Review security findings and remediate public bucket access | Security Command Center, Cloud Storage | Documented |
| [Lab 3 – IAM Custom Roles and Policy Analyzer](03-iam-custom-roles-policy-analyzer/README.md) | Apply least privilege and verify access | IAM, Policy Analyzer, Firebase permissions | Documented |
| [Lab 4 – Assured Workloads](04-assured-workloads/README.md) | Explore compliance-oriented workload boundaries | Assured Workloads | Details pending |
| [Lab 5 – Terraform VPC and Firewall](05-terraform-vpc-firewall/README.md) | Provision network infrastructure as code | Terraform, VPC, firewall rules | Documented |
| [Lab 6 – IAM Threat Detection and Remediation](06-iam-threat-detection/README.md) | Investigate anomalous IAM grants and remove external Owner access | IAM, Security Command Center, Event Threat Detection, Cloud Logging | Documented |

## Learning Progression

1. **Network foundation:** build a custom VPC and control network traffic.
2. **Security posture:** identify and remediate cloud resource exposure.
3. **Identity governance:** create least-privilege roles and verify access.
4. **Compliance:** explore Assured Workloads and compliance-oriented controls.
5. **Infrastructure as Code:** deploy repeatable VPC and firewall resources with Terraform.
6. **Detection and response:** investigate IAM threat findings, analyze audit logs, and remediate excessive access.

## Repository Notes

- All six numbered labs are grouped under this Google Cloud Labs category.
- The lab numbering follows the requested sequence: Assured Workloads is Lab 4, Terraform VPC is Lab 5, and Security Command Center IAM threat investigation is Lab 6.
- Lab 4 is marked pending because detailed task instructions and evidence were not present in the previous repository content.
- Screenshots should be redacted to remove project identifiers, student credentials, personal information, and secrets.
- Never commit Terraform state files, service-account keys, credentials, or other secrets.

⬅️ [Back to the portfolio home](../README.md)
