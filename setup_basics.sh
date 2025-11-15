#!/bin/bash
sudo apt-get install openjdk-17-jdk
mkdir serverfiles
cd serverfiles
sudo wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.4.0/forge-1.20.1-47.4.0-installer.jar
sudo java -jar forge-1.20.1-47.4.0-installer.jar --installServer
echo "\n-Xmx12G" >> user_jvm_args.txt
echo "eula=true" > eula.txt
cd ..
sudo apt install screen
sudo snap install ngrok