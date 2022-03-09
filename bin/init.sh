#!/bin/bash

RED='\033[0;31m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

function convert_kebab_case() {
  echo "$1" |\
  sed 's/\([^A-Z+]\)\([A-Z0-9]\)/\1-\2/g' |\
  sed 's/\([0-9]\)\([A-Z]\)/\1-\2/g' |\
  sed 's/\([A-Z]\)\([0-9]\)/\1-\2/g' |\
  sed 's/--/-/g' |\
  sed 's/\([\/]\)-/\1/g' |\
  tr '[:upper:]' '[:lower:]'
}

PROJECT_NAME="$(convert_kebab_case "$1")"

echo "Creating $PROJECT_NAME"
git clone https://github.com/GregoryCaldeira/create-canvas-ds.git "$PROJECT_NAME"

cd "$PROJECT_NAME"

rm -rf ./README.md
rm -rf ./package.json
rm -rf ./LICENSE
rm -rf ./.gitignore
rm -rf ./bin
rm -rf ./yarn.lock

mv  -v ./templates/* "./"

rm -rf ./templates

exit 0


echo "🔍 Checking all dependencies "

if ! command -v yarn &> /dev/null; then
  echo "${RED}Yarn is not installed"
  echo "${NO_COLOR}See yarn install docs: https://yarnpkg.com/getting-started/install"
  exit 1
fi

echo "${NO_COLOR}Installing dependencies ..."
yarn

exit 0