# google-cloud-cybersecurity-labs
create a VPC using cloud shell
Lab: Create a VPC using Cloud Shell

Commands used:
gcloud compute networks create labnet --subnet-mode=custom

gcloud compute networks subnets create labnet-sub \
--network labnet \
--region us-central1 \
--range 10.0.0.0/28

gcloud compute networks list

gcloud compute networks subnets list --network=labnet
