#!/bin/bash
#!/usr/bin/env bash
check () {
  which packer >/dev/null 2>&1
  sleep 3
  if [ $? = 0 ]; then #if PACKER is installed
    echo "Packer Installation found, checking for Terraform Installation ...."
    sleep 4
    printf "\n"
    which terraform >/dev/null 2>&1
    if [ $? = 0 ]; then
      echo "Terraform installation found Proceeding ...."
      sleep 3
      printf "\n"
      data
    else 
      echo "Terraform not Installed try again after Installing Terraform"
      exit 0
      printf "\n"
    fi  
  else
    echo "Packer Not Installed try again after Installing Packer"
    exit 0
  fi  
}

data () {
  printf "\tCollecting Variables,\n"
  read -p "Enter Access Key:" access
  export TF_VAR_ACCESS="$access"
  printf "\n"
  read -p "Enter Secret Key:" secret
  export TF_VAR_SECRET=$secret
  printf "\n"
  read -p "Enter Region:" region
  export TF_VAR_REGION=$region
  printf "\n"
  read -p "Enter Instance Type:" itype
  export TF_VAR_TYPE=$itype
  printf "\n"
  read -p "Enter Project Name:" project
  export TF_VAR_PROJECT=$project
  printf "\n"
  echo "Select base image"
  printf "\n1. Amazon"
  printf "\n2. Ubuntu\n"
  read -p "Enter the option:" ans
  if [ $ans == '1' ]; then
    export TF_VAR_IMG="amzn2-ami-kernel-5.*-hvm-2.*-x86_64-gp2"
  else  
    export TF_VAR_IMG="ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"
  fi 
  printf "\n"
  read -p "Enter Path of the provision file:" path
  export TF_VAR_PATH=$path
  packer
}

packer () {
  echo "Starting AMI Creation......"
  sleep 3
  $(which packer) init packer/pack.pkr.hcl
  $(which packer) build packer/pack.pkr.hcl
  printf "\n"
  echo "AMI Creation Completed"
  printf "\n Proceeding for Terraform Operations"
  sleep 3
  terraform
}

terraform () {
  printf "\n\tData collection for EC2"
  printf "\n"
  read -p "Enter Key-Pair Name for the Instance (will create a new key pair):" key
  export TF_VAR_KEY=$key
  ssh-keygen -t rsa -N "" -f $key > /dev/null 2>&1
  sleep 3
  printf "\nKey-Pair $key has been created use $key.pub to access the Instance"
  printf "\n"
  read -p "Enter Ingress Ports for Instance (Eg: "20","21",etc):" iport
  export TF_VAR_IPORT="[$iport]"
  echo $TF_VAR_IPORT
  $(which terraform) -chdir="./terraform" init
  printf "\n"
  echo "Completed Initialisation proceeding ..."
  sleep 3
  printf "\n"
  echo "You will soon get a preview of changes that will happen on AWS console,"
  sleep 3
  $(which terraform) -chdir="./terraform" apply
}
printf "\t\t\tBegining the Process\n"
sleep 3
printf "\n"
echo "Checking Packer Installation ....."
printf "\n"
check
