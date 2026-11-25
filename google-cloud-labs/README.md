# Google Cloud Labs

This directory contains the six documented hands-on labs in this Google Cloud cybersecurity learning portfolio. Each lab has its own README with the objective, environment, implementation or investigation steps, results, and skills practiced.

## Lab Index

| Lab | Project | Main Google Cloud services / tools | Status |
|---|---|---|---|
| [Lab 1 – Secure VPC Network](01-secure-vpc-network/README.md) | Build a custom VPC, subnet, and firewall rules | VPC, Cloud Shell, Compute Engine networking | Documented |
| [Lab 2 – Security Command Center: Security Posture](02-security-command-center-posture/README.md) | Review cloud security findings and remediate public bucket access | Security Command Center, Cloud Storage | Documented |
| [Lab 3 – IAM Custom Roles and Policy Analyzer](03-iam-custom-roles-policy-analyzer/README.md) | Apply least privilege with a custom read-only role and verify access | IAM, Policy Analyzer, Firebase permissions | Documented |
| [Lab 4 – Assured Workloads](04-assured-workloads/README.md) | Explore compliance-oriented workload boundaries | Assured Workloads | Documentation pending |
| [Lab 5 – Terraform VPC and Firewall](05-terraform-vpc-firewall/README.md) | Provision network infrastructure as code | Terraform, Google Cloud VPC, firewall rules | Documented |
| [Lab 6 – IAM Threat Detection and Remediation](06-iam-threat-detection/README.md) | Investigate anomalous IAM grants and remove an external Owner grant | IAM, Security Command Center, Event Threat Detection, Cloud Logging | Documented |

## Learning Progression

1. **Network foundation:** build a custom VPC and control network traffic.
2. **Security posture:** identify and remediate cloud resource exposure.
3. **Identity governance:** create least-privilege roles and verify effective access.
4. **Compliance:** examine Assured Workloads and compliance-oriented controls.
5. **Infrastructure as code:** deploy repeatable VPC and firewall resources with Terraform.
6. **Detection and response:** investigate IAM threat findings, analyze audit logs, and remediate excessive access.

## Repository Notes

- All six labs are grouped under this **Google Cloud Labs** category.
- Lab numbering reflects the learning sequence documented in this portfolio.
- Lab 4 currently has a landing page only; add the actual lab steps and evidence after completing or recovering that exercise.
- Screenshots should be redacted to remove project identifiers, student credentials, personal information, and secrets.
- Terraform state files, service-account keys, credentials, and other secrets must never be committed.
