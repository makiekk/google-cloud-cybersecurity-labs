# 🔑 Lab 3: IAM Custom Roles & Policy Analyzer

## Objective
Implement Least Privilege access control by creating a custom IAM role for an audit team requiring read-only Firebase Realtime Database access, followed by verification using Policy Analyzer.

---

## Environment Details
* **Project ID**: `qwiklabs-gcp-02-e890aa98174f`
* **Target Principal**: `student-02-1ac42269de36@qwiklabs.net`
* **Role ID**: `CustomRole`

---

## Implementation Steps

### 1. Create Custom Role
* **Role Title**: `Audit Team Reviewer`
* **Description**: *Custom role granting read-only access to Firebase database resources.*
* **Permissions Granted**:
  * `firebase.clients.list`
  * `firebasedatabase.instances.list`

### 2. Grant Role
Bound `Audit Team Reviewer` (`CustomRole`) to `student-02-1ac42269de36@qwiklabs.net` in IAM settings.

### 3. Policy Analyzer Audit
Ran a custom Policy Analyzer query on principal `student-02-1ac42269de36@qwiklabs.net` to verify permission boundaries.

**Verified Output**:
```json
{
  "role": "projects/qwiklabs-gcp-02-e890aa98174f/roles/CustomRole",
  "members": [
    "user:student-02-1ac42269de36@qwiklabs.net"
  ]
}
```