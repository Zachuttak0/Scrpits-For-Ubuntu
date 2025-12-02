#!/bin/bash
export TERM=xterm
screen -mdS NGRunner bash -c "tailscale up && tailscale serve https:443 / http://localhost:80 && tailscale funnel 443 on && tailscale serve status"
screen -mdS WBRunner bash -c "cd /home/mcserver/WebServer && python app.py"