#!/usr/bin/env bash
set -e -x

pushd spring-music
gradlew assemble
exit_on_error "gradlew error"
popd
