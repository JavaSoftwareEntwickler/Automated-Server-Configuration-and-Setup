
# Progetto DevOps con Strumenti Open-Source

Questo repository contiene gli script di configurazione per un'infrastruttura DevOps completa usando strumenti open-source e gratuiti. Gli script includono configurazioni per l'automazione degli aggiornamenti, backup, monitoraggio, sicurezza, CI/CD, e molto altro.

## Sommario

- [1. Prerequisiti](#1-prerequisiti)
- [2. Descrizione degli Script](#2-descrizione-degli-script)
- [3. Istruzioni di Utilizzo](#3-istruzioni-di-utilizzo)

## 1. Prerequisiti

Prima di eseguire gli script, assicurati di avere:

- Un sistema operativo basato su **Ubuntu** (o derivati).
- **Permessi di superutente (root)** per eseguire alcune operazioni.
- Connessione a Internet per scaricare i pacchetti necessari.
- **Docker** e **rclone** per backup e scalabilità.

## 2. Descrizione degli Script

Gli script forniti automatizzano molte operazioni DevOps comuni. Ecco una panoramica di ciascuno:

### 1. `auto_update.sh`

Questo script automatizza il processo di aggiornamento del sistema e abilita gli aggiornamenti automatici di sicurezza.

```bash
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
```

### 2. `backup.sh`

Esegue il backup dei dati utilizzando **rclone** su un provider cloud (ad esempio Google Drive). Assicurati di configurare rclone prima di eseguire il backup.

```bash
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
```

### 3. `run_all_scripts.sh`

Esegue tutti gli script elencati in sequenza.

```bash
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
```

### 4. `setup_ansible.sh`

Installa e configura **Ansible** per automatizzare il provisioning e la gestione della configurazione.

```bash
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
```

### 5. `setup_auto_scaling.sh`

Configura la scalabilità automatica utilizzando **Docker Swarm** (in alternativa a AWS).

```bash
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
```

### 6. `setup_ci_cd.sh`

Configura **GitLab CI** per l'integrazione continua e il deployment continuo (alternativa a GitHub Actions).

```bash
#!/bin/bash

# Crea una directory per il progetto CI/CD
mkdir -p ~/ci_cd_project
cd ~/ci_cd_project

# Crea il file per GitLab CI/CD
mkdir -p .gitlab-ci.yml
cat <<EOL > .gitlab-ci.yml
stages:
  - build
  - test
  - deploy

build:
  stage: build
  script:
    - npm install

test:
  stage: test
  script:
    - npm test

deploy:
  stage: deploy
  script:
    - npm run deploy
EOL

echo "Configurazione CI/CD con GitLab CI completata!"
```

### 7. `setup_docker.sh`

Installa e configura **Docker**.

```bash
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
```

### 8. `setup_monitoring.sh`

Configura **Prometheus** e **Grafana** per il monitoraggio.

```bash
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
```

### 9. `setup_security.sh`

Configura **UFW**, **WireGuard** e **Certbot** per la sicurezza.

```bash
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
```

### 10. `setup_terraform.sh`

Configura **Terraform** per la gestione delle risorse cloud.

```bash
#!/bin/bash

# Installa Terraform
echo "Installando Terraform..."
sudo apt install -y terraform

# Crea un file di configurazione Terraform
cat <<EOL > main.tf
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
EOL

# Inizializza Terraform
terraform init

# Applica la configurazione
terraform apply
```

### 11. `setup_vault.sh`

Configura **Vault** per la gestione dei segreti.

```bash
#!/bin/bash

# Installa Vault
sudo apt install -y vault

# Avvia Vault in modalità dev
vault server -dev &

# Configura una nuova secret
vault kv put secret/mysecret password="mySecretValue"
```

## 3. Istruzioni di Utilizzo

1. **Clona il repository**:
    ```bash
    git clone https://github.com/JavaSoftwareEntwickler/Automated-Server-Configuration-and-Setup.git
    cd Automated-Server-Configuration-and-Setup
    ```

2. **Esegui gli script**:
    ```bash
    chmod +x run_all_scripts.sh
    ./run_all_scripts.sh
    ```

3. Gli script verranno eseguiti in sequenza e configureranno automaticamente tutti gli strumenti DevOps nel tuo sistema.

---

### Conclusione

Questo progetto ti offre una configurazione completa per l'infrastruttura DevOps utilizzando strumenti open-source. Se desideri personalizzare ulteriormente o aggiungere altre funzionalità, puoi modificare gli script a tuo piacimento.
```

