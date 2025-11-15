#!/bin/bash
screen -mdS NGRunner
screen -S NGRunner -X stuff 'ngrok tcp 25565^M'