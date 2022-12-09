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

mkdir -p "$CHAPTER/start_here"
mkdir -p "$CHAPTER/final"

echo "$CHAPTER/start_here/$APP_NAME"

ls

cd "start" && npx nx g @nrwl/angular:app --name "$APP_NAME" --directory="$CHAPTER" --style scss --routing --e2eTestRunner none --skipDefaultProject --addTailwind
cd "../" && node scripts/rename-app.js "$CHAPTER" "$APP_NAME" start


cd "final" && npx nx g @nrwl/angular:app --name "$APP_NAME" --directory="$CHAPTER" --style scss --routing --e2eTestRunner none --skipDefaultProject --addTailwind
cd "../" && node scripts/rename-app.js "$CHAPTER" "$APP_NAME" final
