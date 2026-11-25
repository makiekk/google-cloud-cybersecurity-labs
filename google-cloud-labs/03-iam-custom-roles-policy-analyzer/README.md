# Lab 3: IAM Custom Roles and Policy Analyzer

## Objective

Apply the principle of least privilege by creating a custom IAM role for an audit user who requires read-only access to selected Firebase Realtime Database resources, then verify the role binding with Policy Analyzer.

## Environment

- Custom role ID: `CustomRole`
- Role title: `Audit Team Reviewer`
- Target: a lab student principal in the `qwiklabs.net` domain

Project identifiers and individual student addresses are omitted from this public write-up.

## Implementation

### 1. Create the custom role

Created a role titled **Audit Team Reviewer** with a description indicating read-only access to the required Firebase database resources.

The permissions included:

- `firebase.clients.list`
- `firebasedatabase.instances.list`

### 2. Assign the role

Bound the custom role to the designated lab audit principal through Google Cloud IAM.

### 3. Verify with Policy Analyzer

Used Policy Analyzer to inspect the principal's access and confirm the custom role binding.

The lab verification showed a project-level custom role in the form:

```json
{
  "role": "projects/PROJECT_ID/roles/CustomRole",
  "members": [
    "user:AUDIT_USER"
  ]
}
```

The project ID and user identity are represented by placeholders to avoid publishing lab-specific identifiers.

## Outcome

- Created a purpose-specific custom IAM role.
- Granted only the listed permissions required for the audit task.
- Used Policy Analyzer to verify the role binding.

## Security Lessons

- Prefer narrowly scoped custom roles when predefined roles grant more access than necessary.
- Review permissions before assigning a role.
- Verify effective access after changing IAM policy.
- Reassess custom roles as application and audit requirements change.

## Skills Practiced

Google Cloud IAM, custom roles, least privilege, Firebase permissions, IAM policy bindings, and Policy Analyzer.
