#!/bin/sh
KEYS_DIR=$1
APP_DIR=$2

docker run --rm -v ${KEYS_DIR}:/keys -v ${APP_DIR}:/public -p 8443:8443 smartcoder/static .
