#!/bin/bash
export TERM=xterm
screen -mdS NGRunner bash -c "ngrok tcp 25565"