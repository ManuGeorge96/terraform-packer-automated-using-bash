## terraform + packer automated using bash

# About

This repo consisit of a Bash Script which integrates both Terraform code and Packer code for building an Infra. Terraform code will create Security Group, Key Pair, and EC2 Instance, Packer code creates an Custom AMI based on the provision script provided, the bash script also allows you to select which base AMI is required while building custom new AMI.

# Input Data Required

- Below data's needs to be provided while performing the task
  - Access Key
  - Secret Key
  - Region
  - Instance Type
  - Provision File Path
  - Key-Pair Name
  - List of Ingress Ports

# How To Use

- ```sh
   git clone 
