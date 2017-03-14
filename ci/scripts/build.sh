#!/usr/bin/env bash
set -e -x

pushd spring-music
#TERM=vt100 ./gradlew assemble
if [ $? != 0 ]
then
   echo "Error en build de spring-music";
   exit 240;
fi
popd

#tar cfj spring-music-bin.tar.bz2 spring-music

echo "hola" > archivo
tar cfj spring-music-bin.tar.bz2 archivo


ftp -n 192.168.0.127 <<EOS
user ftp ftp 
cd pub
bin
put spring-music-bin.tar.bz2
EOS
