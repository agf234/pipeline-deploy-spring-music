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
