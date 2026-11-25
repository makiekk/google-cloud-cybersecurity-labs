# Lab 1: Building a Secure Virtual Private Cloud (VPC)

## Objective

Design and deploy a custom Google Cloud VPC, create a restricted subnet, and control traffic using explicit firewall rules.

## Environment

- VPC: `labnet`
- Subnet: `labnet-sub`
- Region: `us-central1`
- Subnet range: `10.0.0.0/28`

Project identifiers are intentionally omitted from this public write-up.

## Implementation

### 1. Verify the lab environment

```bash
gcloud auth list
gcloud config list project
```

### 2. Create a custom VPC

```bash
gcloud compute networks create labnet --subnet-mode=custom
```

### 3. Create the subnet

```bash
gcloud compute networks subnets create labnet-sub \
  --network labnet \
  --region us-central1 \
  --range 10.0.0.0/28
```

### 4. Allow internal communication

```bash
gcloud compute firewall-rules create labnet-allow-internal \
  --network labnet \
  --allow tcp,udp,icmp \
  --source-ranges 10.0.0.0/28
```

### 5. Configure administrative traffic

```bash
gcloud compute firewall-rules create labnet-allow-ssh-rdp-icmp \
  --network labnet \
  --allow tcp:22,tcp:3389,icmp
```

**Security consideration:** This example does not specify a source range for the SSH/RDP rule, so it can expose those ports broadly. In production, restrict administrative access to trusted IP ranges or use a managed access path such as IAP.

### 6. Verify the configuration

```bash
gcloud compute networks list
gcloud compute networks subnets list --network=labnet
gcloud compute firewall-rules list --filter="network=labnet"
```

## Key Outcomes

- Created a custom-mode VPC instead of relying on the default network.
- Defined a dedicated subnet with a limited CIDR range.
- Added firewall rules for internal and administrative traffic.
- Practiced verifying deployed network resources with the Google Cloud CLI.

## Skills Practiced

VPC networking, subnetting, CIDR notation, firewall configuration, Cloud Shell, Google Cloud CLI, network segmentation, and secure network design.
