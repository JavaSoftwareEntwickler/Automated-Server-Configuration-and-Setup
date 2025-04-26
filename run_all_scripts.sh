#!/bin/bash

# Funzione per eseguire ogni script
run_script() {
    SCRIPT_NAME=$1
    echo "Eseguendo: $SCRIPT_NAME"
    
    # Verifica se il file esiste
    if [ -f "$SCRIPT_NAME" ]; then
        # Rendi eseguibile
        chmod +x "$SCRIPT_NAME"
        
        # Esegui lo script
        ./"$SCRIPT_NAME"
    else
        echo "Errore: il file $SCRIPT_NAME non esiste!"
    fi
}

# Lista degli script da eseguire
SCRIPTS=(
    "setup_ansible.sh"
    "backup.sh"
    "auto_update.sh"
    "setup_docker.sh"
    "setup_ci_cd.sh"
    "setup_monitoring.sh"
    "setup_security.sh"
    "setup_auto_scaling.sh"
    "setup_vault.sh"
    "setup_terraform.sh"
)

# Esegui tutti gli script in sequenza
for SCRIPT in "${SCRIPTS[@]}"; do
    run_script "$SCRIPT"
done

echo "Tutti gli script sono stati eseguiti!"
