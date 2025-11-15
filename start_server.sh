#!/bin/bash
screen -mdS MCRunner
screen -S MCRunner -X stuff 'cd /home/mcserver/serverfiles/ && ./run.sh^M'