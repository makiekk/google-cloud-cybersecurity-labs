# Google Cloud Cybersecurity Labs

This repository contains my hands-on work from the Google Cloud Cybersecurity Fundamentals course.

## Lab 1: Create a VPC using Cloud Shell

### Objective
Create a custom VPC network, create a subnet, and verify the network configuration using Cloud Shell.

### Commands Used

```bash
gcloud compute networks create labnet --subnet-mode=custom

gcloud compute networks subnets create labnet-sub \
  --network labnet \
  --region us-central1 \
  --range 10.0.0.0/28

gcloud compute networks list

gcloud compute networks subnets list --network=labnet
```

### Skills Learned
- Google Cloud Shell
- Virtual Private Cloud (VPC)
- Custom VPC Networks
- Subnets
- gcloud CLI

### Result
Successfully created a custom VPC network and subnet and verified both using Cloud Shell.
