#!/bin/bash
# script_init.sh 
# To install the usefull packages
# Pre-requisite :
# Linux - Ubuntu
# Ensure the script is executed with sudo privileges

# Update and upgrade system packages
echo "Updating and upgrading system packages..."
sudo apt update && sudo apt upgrade -y

# Install Ansible
echo "Installing Ansible..."
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible python3 python3-pip

# Configuration host Ansible
echo "Configuring Ansible inventory..."
cd ./ansible-host-conf
cat <<EOF >hosts.ini
[my_host]
localhost ansible_connection=local ansible_user=$(whoami)
EOF

# Run Ansible playbooks
echo "Running Ansible playbooks..."
if [ -f "kvm_pb.yml" ]; then
    ansible-playbook -i hosts.ini kvm_pb.yml
else
    echo "Error: kvm_pb.yml not found!"
fi

if [ -f "terraform_pb.yml" ]; then
    ansible-playbook -i hosts.ini terraform_pb.yml
else
    echo "Error: terraform_pb.yml not found!"
fi
