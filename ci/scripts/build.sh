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

#tar cvfz spring-music-bin.tar.gz spring-music

#ftp -n 192.168.0.127 <<EOS
#user ftp 
#cd pub
#pass
#bin
#put spring-music-bin.tar.gz
#EOS
