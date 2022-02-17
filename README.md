## terraform + packer automated using bash

# About

This repo consisit of a Bash Script which integrates both Terraform code and Packer code for building an Infra. Terraform code will create Security Group, Key Pair, and EC2 Instance under the dfault VPC, Packer code creates a Custom AMI based on the provision script provided, the bash script also allows you to select which base AMI is required while building the AMI, right now I have included only two options Amazon Linux and Ubuntu.

# Input Data's Required

- Below data's needs to be provided while performing the task
  - Access Key
  - Secret Key
  - Region
  - Instance Type
  - Provision File Path
  - Key-Pair Name
  - List of Ingress Ports

# Outline 

[<img align="center" alt="Unix" width="550" src="https://raw.githubusercontent.com/ManuGeorge96/ManuGeorge96/master/Tools/bash.drawio.png" />][ln]


# How To Use

- ```sh
   git clone https://github.com/ManuGeorge96/terraform-packer-automated-using-bash.git
  ``` 
- ```sh
   cd terraform-packer-automated-using-bash/
  ```
- ```sh
   ./mains.sh  
  ```
  
# Sample Outputs

[<img align="center" alt="Unix" width="750" src="https://raw.githubusercontent.com/ManuGeorge96/ManuGeorge96/master/Tools/1.1.PNG" />][ln]

<br />

[<img align="center" alt="Unix" width="750" src="https://raw.githubusercontent.com/ManuGeorge96/ManuGeorge96/master/Tools/1.2.PNG" />][ln]

<br />

[<img align="center" alt="Unix" width="750" src="https://raw.githubusercontent.com/ManuGeorge96/ManuGeorge96/master/Tools/1.3.PNG" />][ln]

<br />

[<img align="center" alt="Unix" width="750" src="https://raw.githubusercontent.com/ManuGeorge96/ManuGeorge96/master/Tools/1.4.PNG" />][ln]

<br />

[<img align="center" alt="Unix" width="750" src="https://raw.githubusercontent.com/ManuGeorge96/ManuGeorge96/master/Tools/1.5.PNG" />][ln]

<br />

[<img align="center" alt="Unix" width="750" src="https://raw.githubusercontent.com/ManuGeorge96/ManuGeorge96/master/Tools/1.6.PNG" />][ln]






[ln]: https://www.linkedin.com/in/manu-george-03453613a
