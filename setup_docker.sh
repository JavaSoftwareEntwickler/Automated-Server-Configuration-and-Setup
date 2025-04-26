#!/bin/bash

# Aggiorna il sistema
sudo apt update && sudo apt upgrade -y

# Installa Docker
echo "Installando Docker..."
sudo apt install -y docker.io

# Avvia e abilita Docker
sudo systemctl start docker
sudo systemctl enable docker

# Aggiungi l'utente al gruppo docker
sudo usermod -aG docker $USER

# Verifica l'installazione
docker --version
