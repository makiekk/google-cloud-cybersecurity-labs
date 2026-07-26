# 🌐 Lab 1: Building a Secure Virtual Private Cloud (VPC)

## Objective
Design and deploy a secure custom Virtual Private Cloud (VPC) that eliminates default open-network vulnerabilities, isolates cloud resources into subnets, and controls traffic flow via explicit firewall rules.

---

## Environment Details
* **Project ID**: `qwiklabs-gcp-03-1a4cd3bb3caa`
* **VPC Name**: `labnet`
* **Subnet Name**: `labnet-sub` (`10.0.0.0/28` in `us-central1`)

---

## Commands Executed (Cloud Shell)

```bash
# 1. Verify environment configuration
gcloud auth list
gcloud config list project

# 2. Deploy custom VPC network (disabling default auto-subnets)
gcloud compute networks create labnet --subnet-mode=custom

# 3. Create custom restricted subnet
gcloud compute networks subnets create labnet-sub \
    --network labnet \
    --region us-central1 \
    --range 10.0.0.0/28

# 4. Configure internal communication firewall rule
gcloud compute firewall-rules create labnet-allow-internal \
    --network labnet \
    --allow tcp,udp,icmp \
    --source-ranges 10.0.0.0/28

# 5. Configure external management firewall rule
gcloud compute firewall-rules create labnet-allow-ssh-rdp-icmp \
    --network labnet \
    --allow tcp:22,tcp:3389,icmp

# 6. Verify deployment
gcloud compute networks list
gcloud compute networks subnets list --network=labnet
gcloud compute firewall-rules list --filter="network=labnet"
```

---

## Key Outcomes

✅ **Custom VPC Created**: Replaced default auto-networks with tight CIDR subnetting  
✅ **Firewall Rules Configured**: Restricted external access to required administrative ports (SSH/22, RDP/3389)  
✅ **Network Isolation Achieved**: Implemented granular access control

---

## Detailed Walkthrough

### Step 1: Create Custom VPC Network
```bash
gcloud compute networks create labnet --subnet-mode=custom
```
- Creates a new VPC network named `labnet`
- `--subnet-mode=custom` ensures no default auto-generated subnets are created
- Provides full control over subnet configuration

### Step 2: Create Custom Subnet
```bash
gcloud compute networks subnets create labnet-sub \
    --network labnet \
    --region us-central1 \
    --range 10.0.0.0/28
```
- Creates a subnet `labnet-sub` in the `labnet` VPC
- CIDR range: `10.0.0.0/28` (provides 16 addresses, 14 usable)
- Region: `us-central1`
- Small subnet size enforces security through limited address space

### Step 3: Create Internal Firewall Rule
```bash
gcloud compute firewall-rules create labnet-allow-internal \
    --network labnet \
    --allow tcp,udp,icmp \
    --source-ranges 10.0.0.0/28
```
- Allows internal communication between resources
- Protocols: TCP, UDP, ICMP
- Source restricted to subnet range `10.0.0.0/28`
- Default action: INGRESS (inbound traffic)

### Step 4: Create External Management Firewall Rule
```bash
gcloud compute firewall-rules create labnet-allow-ssh-rdp-icmp \
    --network labnet \
    --allow tcp:22,tcp:3389,icmp
```
- Allows external SSH (port 22) and RDP (port 3389) access
- Enables ICMP for ping diagnostics
- No source restriction = allows from any IP address
- Intended for administrative access only

### Step 5: Verify Deployment
```bash
gcloud compute networks list
gcloud compute networks subnets list --network=labnet
gcloud compute firewall-rules list --filter="network=labnet"
```
- Lists all VPC networks
- Lists subnets within the `labnet` VPC
- Lists firewall rules associated with `labnet`

---

## Security Best Practices Applied

1. **Custom VPC**: Eliminated reliance on default GCP networks
2. **Tight Subnetting**: `/28` CIDR range limits address space
3. **Explicit Firewall Rules**: Deny-by-default, allow specific ports
4. **Internal Segmentation**: Separate rules for internal vs. external traffic
5. **Port Restriction**: Only essential administrative ports exposed

---

## Verification Output Example

```
NAME: labnet
AUTO_CREATE_SUBNETWORKS: False
IPV4_RANGE:

NAME: labnet-sub
NETWORK: labnet
IPV4_CIDR_RANGE: 10.0.0.0/28
REGION: us-central1

NAME: labnet-allow-internal
NETWORK: labnet
DIRECTION: INGRESS
PRIORITY: 1000
ALLOW: tcp,udp,icmp

NAME: labnet-allow-ssh-rdp-icmp
NETWORK: labnet
DIRECTION: INGRESS
PRIORITY: 1000
ALLOW: tcp:22,tcp:3389,icmp
```

---

## Lessons Learned

- Default GCP networks are convenient but insecure for production workloads
- Custom VPCs provide complete control over network topology
- Firewall rules should follow the principle of least privilege
- CIDR notation (`/28`) defines subnet size and available addresses
- Network segmentation is critical for cloud security