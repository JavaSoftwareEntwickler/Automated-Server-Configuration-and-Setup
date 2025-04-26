#!/bin/bash

# Installa AWS CLI
sudo apt install -y awscli

# Configura AWS CLI con accesso AWS
aws configure

# Crea un Auto Scaling Group
echo "Configurando Auto Scaling Group su AWS..."
aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name my-auto-scaling-group \
    --instance-id i-1234567890abcdef0 \
    --min-size 1 \
    --max-size 5 \
    --desired-capacity 2 \
    --availability-zones us-east-1a
