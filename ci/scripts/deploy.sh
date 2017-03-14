#!/usr/bin/env bash
set -e

### Load env

pushd spring-music
cf push
exit_on_error "Error pushing app"
popd
