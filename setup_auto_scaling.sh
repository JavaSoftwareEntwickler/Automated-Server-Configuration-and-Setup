#!/bin/bash

# Installa Docker (se non è già installato)
echo "Installa Docker..."
sudo apt install -y docker.io

# Inizializza Docker Swarm
echo "Inizializzando Docker Swarm..."
sudo docker swarm init

# Crea un servizio con replica automatica
echo "Creando un servizio con replica automatica..."
sudo docker service create --name my-service --replicas 3 nginx

echo "Scalabilità automatica configurata con Docker Swarm!"
