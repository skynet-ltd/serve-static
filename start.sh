#!/bin/sh
APP_DIR=$1
KEYS_DIR=$2
PORT=8443

if [ -z "$APP_DIR" ] || [ ! -d "$APP_DIR" ]; then
	echo "Please provide path to your application folder"
	exit -1
fi

if [ -n "$APP_PORT" ]; then
	PORT="$APP_PORT"
fi

if [ -z "$KEYS_DIR" ] || [ ! -d "$KEYS_DIR" ]; then
	echo "Default tls certificate will be used..."
	docker run --rm -e TLS_CERT=./keys/host.crt -e TLS_KEY=./keys/host.key -v ${APP_DIR}:/public -p ${PORT}:443 smartcoder/serve-static .
else
	docker run --rm -v ${KEYS_DIR}:/keys -v ${APP_DIR}:/public -p ${PORT}:443 smartcoder/serve-static .
fi
