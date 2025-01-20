# Projet Infrastructure Cloud

### Overview

...

## RUN project

### Run the infrastructure with Terraform

`cd /tf-conf`

`terraform get`

`terraform init`

`terraform get `

### Run playbook for configuration

`cd ../ansible-host-conf`

`sudo ansible-playbook -i hosts.ini host_pb.yml`

`sudo ansible-playbook -i hosts.ini pc_distant_pb.yml`

`sudo ansible-playbook -i hosts.ini spark_config_pb.yml`

`sudo ansible-playbook -i hosts.ini spark_launch_pb.yml`

# TODO

- changer les noms des tasks
- tester les playbook pc portable et pc2

## Configuration ( Beta )

[https://wax-appliance-a70.notion.site/Projet-Cloud-146168dfe73d8085acf0d233b1fbce9d?pvs=74](https://wax-appliance-a70.notion.site/Projet-Cloud-146168dfe73d8085acf0d233b1fbce9d?pvs=74)
