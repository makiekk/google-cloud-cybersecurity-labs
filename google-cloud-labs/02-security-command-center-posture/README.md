# Lab 2: Security Command Center – Cloud Security Posture

## Objective

Review Google Cloud security findings, identify exposed Cloud Storage resources, and remediate public access risks.

## Environment

A temporary Google Cloud Skills Boost / Qwiklabs project was used. Project identifiers are omitted from this public write-up.

## Findings Reviewed

### 1. PUBLIC_BUCKET_ACL

- **Severity:** High
- **Issue:** A Cloud Storage bucket used legacy object ACLs that allowed public or anonymous access.

### 2. BUCKET_LOGGING_DISABLED

- **Severity:** Low
- **Issue:** Cloud Storage access logging was not enabled for the affected bucket.

The lab also presented compliance posture information for CIS Controls and CIS Google Cloud Foundation benchmarks.

## Remediation

1. Opened **Cloud Storage → Buckets → Permissions**.
2. Reviewed the permissions on the affected bucket.
3. Enabled **Uniform bucket-level access** so access is managed consistently through IAM.
4. Removed public principals such as `allUsers` and `allAuthenticatedUsers` where present and unauthorized.
5. Rechecked the bucket permissions and Security Command Center findings.

## Results

- Addressed the public bucket access finding by removing unauthorized public access.
- Enabled uniform bucket-level access to centralize permission management.
- Reviewed the logging finding and the importance of access visibility.

## Security Lessons

- Public bucket access can expose stored data to unauthenticated users.
- Uniform bucket-level access reduces complexity from mixed object ACL and IAM permissions.
- Logging is important for investigating access to sensitive data.
- Security Command Center findings require validation and prioritization, followed by remediation and verification.

## Skills Practiced

Security Command Center, security posture review, Cloud Storage permissions, IAM-based access control, Uniform bucket-level access, vulnerability triage, and remediation.
