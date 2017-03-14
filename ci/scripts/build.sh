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

tar cfj spring-music-bin.tar.bz2 spring-music

set +x
echo "machine 192.168.0.127 login anonymouse password 123" >> ~/.netrc
set -x


ftp -n 192.168.0.127 <<EOF
user anonymous
pass anonymous
cd pub
bin
put spring-music-bin.tar.bz2
EOF 
