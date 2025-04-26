#!/bin/bash

# Aggiorna il sistema
sudo apt update && sudo apt upgrade -y

# Installa Ansible
echo "Installando Ansible..."
sudo apt install -y ansible

# Crea una directory per i playbook di Ansible
mkdir -p ~/ansible/playbooks

# Crea un esempio di inventario
cat <<EOL > ~/ansible/inventory.ini
[webservers]
192.168.1.10 ansible_ssh_user=ubuntu
EOL

# Crea un playbook di esempio per installare Nginx
cat <<EOL > ~/ansible/playbooks/install_nginx.yml
---
- name: Installazione di Nginx
  hosts: webservers
  become: yes
  tasks:
    - name: Installazione di Nginx
      apt:
        name: nginx
        state: present
    - name: Avviare Nginx
      service:
        name: nginx
        state: started
        enabled: yes
EOL

echo "Ansible configurato. Esegui il playbook con:"
echo "ansible-playbook -i ~/ansible/inventory.ini ~/ansible/playbooks/install_nginx.yml"
