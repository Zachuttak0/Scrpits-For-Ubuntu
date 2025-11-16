#!/bin/bash
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 25565/tcp
sudo ufw enable
sudo apt-get install openjdk-17-jdk
mkdir serverfiles
cd serverfiles
sudo wget maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.4.0/forge-1.20.1-47.4.0-installer.jar
sudo java -jar forge-1.20.1-47.4.0-installer.jar --installServer
echo "\n-Xmx12G" >> user_jvm_args.txt
echo "eula=true" > eula.txt
mkdir mods
mkdir config
cd ..
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/start_server.sh
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/startup_run.sh
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/stop_server.sh
sudo chmod +x startup_run.sh
sudo chmod +x start_server.sh
sudo chmod +x stop_server.sh
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/config.sh
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/mods.sh
sudo chmod +x mods.sh
sudo chmod +x config.sh
sudo bash -c 'cat <<EOF > /etc/systemd/system/myscript.service
[Unit]
Description=My custom startup script
After=network.target

[Service]
ExecStart=/home/mcserver/startup_run.sh
User=mcserver
Type=simple

[Install]
WantedBy=multi-user.target
EOF'
sudo systemctl enable myscript.service

sudo -u mcserver crontab -l 2>/dev/null | grep -F "0 12 * * * /home/mcserver/start_server.sh" >/dev/null
if [ $? -ne 0 ]; then
    ( sudo -u mcserver crontab -l 2>/dev/null; echo "0 12 * * * /home/mcserver/start_server.sh" ) | sudo -u mcserver crontab -
    echo "Cron job installed for user mcserver."
else
    echo "Cron job already exists for user mcserver."
fi

sudo -u mcserver crontab -l 2>/dev/null | grep -F "0 0 * * * /home/mcserver/stop_server.sh" >/dev/null
if [ $? -ne 0 ]; then
    ( sudo -u mcserver crontab -l 2>/dev/null; echo "0 0 * * * /home/mcserver/stop_server.sh" ) | sudo -u mcserver crontab -
    echo "Cron job installed for user mcserver."
else
    echo "Cron job already exists for user mcserver."
fi

sudo apt install screen
sudo apt install openssh-server
sudo snap install ngrok