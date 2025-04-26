#!/bin/bash

# Installa Vault
sudo apt install -y vault

# Avvia Vault in modalità dev
vault server -dev &

# Configura una nuova secret
vault kv put secret/mysecret password="mySecretValue"
