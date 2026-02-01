#!/bin/bash
export TERM=xterm
screen -mdS WBRunner bash -c "cd /home/mcserver/WebServer && python app.py"
screen -L -Logfile /home/mcserver/trader/logs.log -mdS BTRunner bash -c "cd /home/mcserver/trader && python3 bot.py"
