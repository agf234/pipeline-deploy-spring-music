#!/usr/bin/env bash
set -e -x

### Load env

ftp -n 192.168.0.127 <<EOF
user ftp
pass 
bin
cd pub
get spring-music-bin.tar.bz2
EOF

tar xvfj spring-music-bin.tar.bz2

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
