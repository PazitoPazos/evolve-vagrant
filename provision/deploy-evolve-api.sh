#!/bin/bash
echo "================ DEPLOY EVOLVE API ================"
echo "Deploying Evolve API..."
git clone https://github.com/PazitoPazos/evolve-api.git
cd evolve-api
npm install
chown -R vagrant: .