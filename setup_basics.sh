#!/bin/bash
sudo apt update
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow from 10.151.8.51
sudo ufw enable
sudo apt-get install openjdk-17-jdk
mkdir serverfiles
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/del_world.sh
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/start_server.sh
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/startup_run.sh
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/stop_server.sh
sudo chmod +x startup_run.sh
sudo chmod +x del_world.sh
sudo chmod +x start_server.sh
sudo chmod +x stop_server.sh
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/config.sh
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/mods.sh
sudo chmod +x mods.sh
sudo chmod +x config.sh
sudo chown -R mcserver:mcserver /home/mcserver/start_server.sh
sudo chown -R mcserver:mcserver /home/mcserver/stop_server.sh
sudo chown -R mcserver:mcserver /home/mcserver/mods.sh
sudo chown -R mcserver:mcserver /home/mcserver/config.sh
sudo chown -R mcserver:mcserver /home/mcserver/del_world.sh
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/mc_setup.sh
sudo chmod +x mc_setup.sh
sudo chown -R mcserver:mcserver /home/mcserver/mc_setup.sh
sudo ./mc_setup.sh
sudo chown -R mcserver:mcserver /home/mcserver/serverfiles
sudo bash -c 'cat <<EOF > /etc/systemd/system/myscript.service
[Unit]
Description=My custom startup script
After=network.target

[Service]
User=mcserver
Type=simple
Environment=TERM=xterm
PAMName=login
ExecStart=/home/mcserver/startup_run.sh

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
curl -fsSL https://tailscale.com/install.sh | sh && sudo tailscale up --auth-key=tskey-auth-kgnpmeWEup11CNTRL-uwBgYmJvrjN7e4dZuuVDjNHhNAJMdiYZ3
sudo tailscale set --operator=mcserver
sudo apt upgrade
sudo wget raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/set_stuff.sh
sudo chmod +x set_stuff.sh
sudo chown -R mcserver:mcserver /home/mcserver/set_stuff.sh
sudo ./set_stuff.sh
sudo timedatectl set-timezone America/New_York
sudo timedatectl set-ntp yes
pip install --break-system-packages alpaca-py pandas numpy yfinance Flask requests python-dateutil
