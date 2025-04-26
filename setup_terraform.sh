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
