#!/bin/bash
exit 0
SCREEN=/usr/bin/screen
BASH=/bin/bash
SERVER_DIR=/home/mcserver/serverfiles
SESSION_NAME=MCRunner

export HOME=/home/mcserver
export USER=mcserver
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

$SCREEN -mdS $SESSION_NAME
$SCREEN -S $SESSION_NAME -p 0 -X stuff 'cd /home/mcserver/serverfiles && sudo ./run.sh^M'