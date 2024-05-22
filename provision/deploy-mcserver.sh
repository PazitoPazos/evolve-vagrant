#!/bin/bash
VERSION='https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/496/downloads/paper-1.20.4-496.jar'

echo "===================== CREATE START SCRIPT ========================"
echo "Creating script for start server..."
echo "#/bin/bash" > start.sh
echo "cd /mcserver" >> start.sh
echo "exec java -Xms1G -Xmx3G -jar paper.jar --nogui" >> start.sh

echo "================ DEPLOY MINECRAFT SERVER ================"
echo "Deploying Minecraft Server..."
mkdir /mcserver
chmod -R 777 /mcserver
cd /mcserver
curl "${VERSION}" -o paper.jar
echo "eula=true" > eula.txt
