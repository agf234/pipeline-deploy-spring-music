#!/usr/bin/env bash
set -e

### Load env
mkdir spring-music

cd spring-music
ftp -h
ftp -u ftp 192.168.0.127 << EOF
cd pub
mget spring-music*tar.bz2
EOF
cd spring-music
yes admin | cf dev target 192.168.0.127
cf push
