#!/bin/bash
cd serverfiles
cd mods
sudo rm -rf *
sudo curl -sL raw.githubusercontent.com/Zachuttak0/Scrpits-For-Ubuntu/main/online_mods.sh | bash
cd ..
cd ..