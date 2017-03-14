#!/usr/bin/env bash
set -e

### Load env
mkdir spring-music

cd spring-music
ftp -n 192.168.0.127 <<EOF
user anonymous
pass 
bin
cd pub
mget spring-music-bin.tar.bz2
EOF

cd spring-music

yes admin | cf dev target 192.168.0.127
if [ $? != 0 ];
then
    echo "Error en cf dev target";
    exit 245;
fi

cf push
if [ $? != 0 ];
then
    echo "Error en cf push";
    exit 244;
fi
