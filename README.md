# Projet Infrastructure Cloud

### Overview

...

## RUN project

### Run playbooks configuration for PC1 and PC2

`cd /ansible-host-conf`

`sudo ansible-playbook -i hosts.ini host_pb.yml`  

`sudo ansible-playbook -i hosts.ini pc_distant_pb.yml`  

### Run the infrastructure with Terraform

`cd ../tf-conf`

`terraform get`

`terraform init`

`terraform get `

### Run playbook for configuration Spark

`cd ../ansible-host-conf`

`sudo ansible-playbook -i hosts.ini spark_config_pb.yml`

`sudo ansible-playbook -i hosts.ini spark_launch_pb.yml`
