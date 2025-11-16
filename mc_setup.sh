#!/bin/bash
cd serverfiles
sudo rm -rf *
sudo curl -sL raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/online_installer.sh | bash
sudo java -jar installer.jar --installServer
echo "\n-Xmx12G" >> user_jvm_args.txt
echo "eula=true" > eula.txt
mkdir mods
mkdir config
cd ..
sudo ./config.sh
sudo ./mods.sh