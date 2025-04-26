#!/bin/bash

# Aggiorna il sistema
sudo apt update

# Installa AWS CLI
echo "Installando AWS CLI..."
sudo apt install -y awscli

# Configura AWS CLI con le credenziali (questo richiede l'accesso AWS)
echo "Configura AWS CLI con accesso AWS"
aws configure

# Esegui il backup con AWS S3
echo "Eseguendo il backup su AWS S3..."
aws s3 sync /var/www s3://my-backup-bucket/ --delete

echo "Backup completato!"
