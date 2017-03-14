#!/usr/bin/env bash
set -e -x

pushd spring-music
TERM=vt100 ./gradlew assemble
if [ $? != 0 ]
then
   echo "Error en build de spring-music";
   exit 240;
fi
popd

du -sm spring-music

tar cvfj spring-music-bin.tar.bz2 spring-music

ftp 192.168.0.127 << EOF
cd pub
put spring-music-bin.tar.bz2
EOF 
