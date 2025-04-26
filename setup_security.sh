#!/bin/bash

# Configura UFW per il firewall
echo "Configurando il firewall UFW..."
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw enable

# Installa WireGuard (VPN)
echo "Installando WireGuard..."
sudo apt install -y wireguard

# Installa Certbot per SSL
echo "Installando Certbot per SSL..."
sudo apt install -y certbot python3-certbot-nginx

# Ottieni il certificato SSL
echo "Configurando Let's Encrypt SSL..."
sudo certbot --nginx -d esempio.com -d www.esempio.com

echo "Sicurezza configurata!"
