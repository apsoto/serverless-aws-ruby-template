#!/bin/bash

# strict mode: https://www.google.com/search?q=bash+strict+mode
set -euo pipefail
IFS=$'\n\t'
# set -x # uncomment to echo commands to assist debug

TEMPLATE_PATH=${1:-$(pwd)/template}
SERVICE_NAME="my-service"

pushd /tmp

rm -rf "$SERVICE_NAME"
sls create --template-path "$TEMPLATE_PATH" -n "$SERVICE_NAME"
cd "$SERVICE_NAME"
npm install
bundle config set path --local 'vendor/bundle'
bundle install --standalone
bundle exec rubocop
bundle exec rake
sls package
sls invoke local -f hello

popd