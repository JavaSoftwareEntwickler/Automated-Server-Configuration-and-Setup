#!/bin/bash

# Crea una directory per il progetto CI/CD
mkdir -p ~/ci_cd_project
cd ~/ci_cd_project

# Crea il file GitHub Actions
mkdir -p .github/workflows
cat <<EOL > .github/workflows/ci_cd.yml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Setup Node.js
        uses: actions/setup-node@v2
        with:
          node-version: '14'
      - run: npm install
      - run: npm test
      - run: npm run deploy
EOL

echo "Configurazione CI/CD con GitHub Actions completata!"
