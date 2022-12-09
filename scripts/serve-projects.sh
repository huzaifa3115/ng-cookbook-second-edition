#!/bin/bash

if [ -z $1 ]; then
  echo "error: App Name not provided" >&2
  exit 1
fi

APP_NAME=$1

cd "start" && nx serve "$APP_NAME" --port=4200 &
cd "final" && nx serve "$APP_NAME" --port=4201 && kill $!
