#!/usr/bin/env bash
set -e -x

### Load env

ftp -n 192.168.0.127 <<EOF
user ftp
pass 
bin
cd pub
ls -l 
get spring-music-bin.tar.gz
EOF

tar xvfz spring-music-bin.tar.gz

cd spring-music

yes admin | cf login -a https://192.168.11.11 --skip-ssl-validation
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
