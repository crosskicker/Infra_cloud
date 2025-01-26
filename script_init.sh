#!/bin/bash
# script_init.sh 
# Pre-requisite :
# with sudo privileges


if command -v ansible > /dev/null 2>&1; then
    echo "Ansible est déjà installé."
else   
    # Installation Ansible
    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible python3 python3-pip
fi

# Mettre la clé sur PC2
#ssh-copy-id -i ~/.ssh/id_rsa.pub cross@192.168.1.169


# Lancement des configuration PC1 et PC2
cd ./ansible-host-conf

# playbook PC1
echo "Running Ansible playbooks..."
if [ -f "host_pb.yml" ]; then
    ansible-playbook -i hosts.ini host_pb.yml
else
    echo "Error: host_pb.yml not found!"
fi

sleep 5

# playbook PC2
if [ -f "pc_distant_pb.yml" ]; then
    ansible-playbook -i hosts.ini pc_distant_pb.yml
else
    echo "Error: pc_distant_pb.yml not found!"
fi

sleep 5

# Lancement de terraform
cd ../tf-conf

terraform get

terraform init

terraform apply -auto-approve

echo "terraform finished"
echo "VMs Starting (60 sec waiting)"

sleep 60


#Lancement de la configuration de Spark
cd ../ansible-host-conf

if [ -f "spark_config_pb.yml" ]; then
    ansible-playbook -i hosts.ini spark_config_pb.yml
else
    echo "Error: spark_config_pb.yml not found!"
fi

sleep 5

#Lancement de l'application Spark
if [ -f "spark_launch_pb.yml" ]; then
    ansible-playbook -i hosts.ini spark_launch_pb.yml
else
    echo "Error: spark_launch_pb.yml not found!"
fi

sleep 5