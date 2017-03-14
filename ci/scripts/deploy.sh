#!/usr/bin/env bash
set -e

### Load env

pushd binary
cf push
exit_on_error "Error pushing app"
popd
