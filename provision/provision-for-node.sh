#!/bin/bash
echo "================ PROVISION FOR NODEJS ================"
apt-get update -y
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt install nodejs -y
