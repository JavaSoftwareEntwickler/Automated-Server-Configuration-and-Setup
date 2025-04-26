#!/bin/bash

# Esegui il backup con rclone su Google Drive o altro provider
echo "Installando rclone per il backup..."

# Installa rclone
sudo apt install -y rclone

# Configura rclone (richiede la configurazione tramite rclone config)
echo "Esegui rclone config per configurare il tuo provider di cloud storage."

# Sincronizza i dati con Google Drive (modifica con il tuo remote e path)
echo "Eseguendo il backup su Google Drive..."
rclone sync /var/www remote:backup-folder --delete

echo "Backup completato!"
