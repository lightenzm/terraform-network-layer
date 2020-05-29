# terraform-network-layer
The repo contains the Hashicorp Terraform resources files to create AWS network components.
This repo is part of my final [Cloud School](https://www.linkedin.com/company/cloud-school/) ['Flight Price Alarm'](https://github.com/lightenzm/flight-price-alarm) project

## What are we provisioning here?
- nat-gateway
- an elastic ip
- a VPC
- subnets
- an admin RSA public key (for SSH connection to the instances)

## Persistence
- The terraform statefile is stored in an AWS S3 bucket
- The terraform lock file is stored in AWS Dynamodb

## How to use
- Clone this repository
- cd the 'modules' directory
- Type 'terraform apply' (the first time would require 'terraform init'. You will be required to fill the missing variables at this point if they are missing)
