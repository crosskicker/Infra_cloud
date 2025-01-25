#!/bin/bash
# script_init.sh 
# To install the usefull packages
# Pre-requisite :
# Linux - Ubuntu
# Ensure the script is executed with sudo privileges

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update

# Install Ansible
echo "Installing Ansible..."
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible python3 python3-pip

# Mettre la clé sur PC2
#ssh-copy-id -i ~/.ssh/id_rsa.pub cross@192.168.1.169


# Configuration host Ansible
#cd ./ansible-host-conf


# Run Ansible playbooks
#echo "Running Ansible playbooks..."
#if [ -f "kvm_pb.yml" ]; then
#    ansible-playbook -i hosts.ini kvm_pb.yml
#else
#    echo "Error: kvm_pb.yml not found!"
#fi

