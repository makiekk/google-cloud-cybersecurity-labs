# Lab 6: Google Cloud IAM Threat Detection and Incident Remediation

## Overview

This hands-on lab demonstrates how to investigate anomalous Identity and Access Management (IAM) grants in Google Cloud. An external Gmail account is deliberately granted the Project Owner role in a controlled Google Cloud Skills Boost / Qwiklabs environment. The resulting Event Threat Detection findings are reviewed in Security Command Center, correlated with Cloud Audit Logs, and remediated by removing the excessive permission.

**Services:** IAM, Security Command Center, Event Threat Detection, Cloud Logging  
**Focus:** Cloud IAM, threat detection, audit log analysis, incident response

> **Safety note:** The external Owner grant is intentionally simulated for this lab only. Do not reproduce this configuration in a production project.

## Objectives

- Trigger an IAM anomalous-grant finding by assigning Project Owner to an external principal.
- Review and filter findings in Security Command Center.
- Distinguish expected lab provisioning activity from the simulated malicious grant.
- Use Cloud Audit Logs to identify the initiating principal and target account.
- Remove the external account's Owner role and verify the IAM policy update.

## 1. Simulate the IAM Grant

In **IAM & Admin → IAM**, add the external lab principal and assign:

| Setting | Value |
|---|---|
| Principal | `bad.actor.demo@gmail.com` |
| Role category | Basic |
| Role | Owner |

This deliberately creates an anomalous external privilege grant and is expected to trigger Event Threat Detection. The grant is performed only in the temporary lab project.

## 2. Find the Security Alerts

Open **Security → Findings** in Google Cloud Console.

Filter by category:

`Persistence: IAM anomalous grant`

The lab produces two findings. Sort by **Event time** to compare the earlier and later events.

## 3. Investigate and Classify the Findings

Open each finding and inspect **Principal email** on the Summary tab. Then open **Source Properties** and expand:

`properties → sensitiveRoleGrant → members`

The principal email identifies the account that initiated the grant; the member entry identifies the account that received the role.

| Finding | Observed target | Assessment |
|---|---|---|
| Earlier event | A student user in the `qwiklabs.net` organization | Benign, expected lab provisioning |
| Later event | `bad.actor.demo@gmail.com` | Simulated malicious / unauthorized external grant |

**Conclusion:** The later finding is the genuine incident in this exercise because it concerns the deliberately added external Gmail principal. The earlier finding is expected provisioning activity within the lab organization.

## 4. Correlate the Event in Cloud Logging

Open **Logs Explorer** and run:

```text
protoPayload.authorizationInfo.permission="resourcemanager.projects.setIamPolicy"
protoPayload.methodName="InsertProjectOwnershipInvite"
```

Expand the matching audit log and select **Expand nested fields**.

| Audit log field | Investigation purpose |
|---|---|
| `authenticationInfo` | Identifies the account that initiated the request |
| `request` | Contains details of the ownership invitation and target identity |
| `requestMetadata` | Provides request context, including caller IP and user-agent when present |
| `authorizationInfo` | Shows the permission evaluated as part of the request |

For the simulated external grant, the lab identifies a student account belonging to `qwiklabs.net` as the initiating account. The external Gmail address is the recipient of the Owner grant.

The initiating account and recipient are different identities. Do not assume the account receiving elevated privileges is also the account that made the request.

## 5. Remediate the External Grant

Return to **IAM & Admin → IAM**.

1. Locate `bad.actor.demo@gmail.com`.
2. Open **Edit principal**.
3. Remove the **Owner** role.
4. Save the updated IAM policy.
5. Confirm that the external principal no longer has the Owner role.

This removes the excessive project-level privilege introduced during the simulation.

## Investigation Summary

| Stage | Result |
|---|---|
| Detection | Event Threat Detection generated IAM anomalous-grant findings |
| Triage | Two findings in the same category were reviewed |
| Benign activity | Earlier grant to an internal `qwiklabs.net` student account |
| Simulated malicious activity | Later grant to the external Gmail account |
| Log analysis | Cloud Audit Logs identified the initiating student account and request context |
| Remediation | Owner role removed from the external principal |

## Key Takeaways

- An alert is a lead for investigation, not proof of malicious intent by itself.
- Validate both the initiating principal and the target principal.
- Organizational context and expected provisioning workflows matter when classifying IAM alerts.
- Cloud Audit Logs help reconstruct who performed a sensitive action and which identity received access.
- Apply least privilege and remove unnecessary external access promptly.

## Tools and Skills

**Tools:** Google Cloud IAM, Security Command Center, Event Threat Detection, Cloud Logging / Logs Explorer.

**Skills practiced:** IAM privilege review, anomalous grant investigation, cloud audit log analysis, alert triage, and incident remediation.

## Lab Scope and Disclaimer

This was a guided, authorized training exercise in a temporary Google Cloud lab environment. The external account and privilege grant were used to simulate suspicious activity. This write-up documents the lab workflow and expected observations; it does not claim investigation of a real-world compromise.

Screenshots and environment-specific identifiers are intentionally omitted. Add redacted evidence from your own completed lab if available.
