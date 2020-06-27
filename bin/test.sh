#!/bin/bash

# strict mode: https://www.google.com/search?q=bash+strict+mode
set -euo pipefail
IFS=$'\n\t'
# set -x # uncomment to echo commands to assist debug


pushd /tmp
pwd
rm -rf my-service
sls create --template-path /Users/asoto/projects/apsoto/serverless-aws-ruby-template/template -n my-service
cd my-service
npm install
bundle config set path --local 'vendor/bundle'
bundle install --standalone
bundle exec rubocop
bundle exec rake
sls package
sls invoke local -f hello

popd