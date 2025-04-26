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
