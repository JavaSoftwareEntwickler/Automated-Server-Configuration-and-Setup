#!/bin/bash

# Aggiorna il sistema
sudo apt update && sudo apt upgrade -y

# Abilita aggiornamenti automatici
echo "Configurando gli aggiornamenti automatici..."
sudo apt install -y unattended-upgrades

# Abilita il servizio
sudo dpkg-reconfigure -plow unattended-upgrades

# Abilita la configurazione automatica di sicurezza
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
