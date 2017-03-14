#!/usr/bin/env bash
set -e -x

### Load env
curl http://spring-music.local.pcfdev.io
if [ $? != 0 ];
then
    echo "Error en cf push"; 
    exit 244;
fi
