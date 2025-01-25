# Projet Infrastructure Cloud

### Overview

Ce projet a pour but de mettre en place une infrastructure système à base de machines virtuelles avec l’hyperviseur KVM de manière automatisé via Terraform qui permet de faire de l’Infrastructure as Code (IaC) tout en ajoutant une partie de configuration automatisée pour le déploiement et la mise en service de Spark de facon distribuée par l’intermédiaire de Ansible qui est un outil de gestion et de configuration des machines....

## RUN  project  Automatic

`chmod +x script_init.sh`

`sudo ./script_init.sh`

### Don't forget

destroy the project properly :

`terraform destroy`

## RUN project manually

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
