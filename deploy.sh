#!/bin/bash
tar czf app-server.tar.gz audio_files lib transcribed_files app-server-benkyo package.json
scp app-server.tar.gz root@165.227.29.87:~
rm app-server.tar.gz

ssh root@165.227.29.87 << 'ENDSSH'
pm2 stop app-server
rm -rf app-server
mkdir app-server
tar xf app-server.tar.gz -C app-server
rm app-server.tar.gz
cd app-server
yarn install
pm2 start app-server-benkyo.js
ENDSSH

