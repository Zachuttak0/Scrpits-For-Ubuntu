#!/bin/bash
cd serverfiles
cd config
rm -rf *
sudo curl -sL raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/online_config.sh | bash
cd ..
cd ..