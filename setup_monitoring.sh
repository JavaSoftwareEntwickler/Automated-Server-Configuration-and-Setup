#!/bin/bash

# Aggiorna il sistema
sudo apt update && sudo apt upgrade -y

# Installa Prometheus
echo "Installando Prometheus..."
sudo apt install -y prometheus

# Avvia Prometheus
sudo systemctl start prometheus
sudo systemctl enable prometheus

# Installa Grafana
echo "Installando Grafana..."
sudo apt install -y grafana

# Avvia Grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

echo "Prometheus e Grafana configurati!"
