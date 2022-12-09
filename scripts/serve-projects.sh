#!/bin/bash

re='^[0-9]+$'
if ! [[ $1 =~ $re ]]; then
  echo "error: Chapter is not a number" >&2
  exit 1
fi

if [ -z $2 ]; then
  echo "error: App Name not provided" >&2
  exit 1
fi

CHAPTER="chapter$1"
APP_NAME=$2

cd "start" && nx serve "$APP_NAME" --port=4200 &
cd "final" && nx serve "$APP_NAME" --port=4201 && kill $!
