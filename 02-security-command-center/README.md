# 🛡️ Lab 2: Security Command Center (SCC)

## Objective
Evaluate the security posture of Google Cloud resources using Security Command Center, identify active vulnerability findings, and remediate cloud storage access risks.

---

## Environment Details
* **Project ID**: `qwiklabs-gcp-03-1ecd40acd28e`

---

## Key Findings Identified

### 1. PUBLIC_BUCKET_ACL
**Severity**: High  
Cloud Storage bucket flagged for maintaining legacy object ACLs permitting anonymous/public access.

### 2. BUCKET_LOGGING_DISABLED
**Severity**: Low  
Cloud Storage bucket flagged for missing access logs.

### 3. Compliance Standards Tracked
* **CIS Controls 8.0**: 59% passing
* **CIS GCP Foundation 1.0**: 71% passing
* **CIS GCP Foundation 1.1**: 73% passing
* **CIS GCP Foundation 1.2 & 1.3**: 78% passing

---

## Remediation Steps

### Step 1: Access Cloud Storage Permissions
1. Opened **Cloud Storage** → **Buckets** → **Permissions**
2. Identified buckets with overly permissive access

### Step 2: Enable Uniform Bucket-Level Access
1. Selected the affected bucket
2. Enabled **Uniform Bucket-Level Access** setting
3. This enforces project IAM policies across all bucket objects

### Step 3: Remove Public Access
1. Removed broad `allUsers` principal
2. Removed `allAuthenticatedUsers` principal
3. Blocked all anonymous access

---

## Compliance Improvements

✅ **Remediated**: `PUBLIC_BUCKET_ACL` vulnerability  
✅ **Verified**: Compliance against CIS GCP Foundation Benchmarks  
✅ **Improved**: Overall security posture score