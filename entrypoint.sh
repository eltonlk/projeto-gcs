#!/bin/bash
set -e

cd $APP_FOLDER

# Create the Rails production DB on first run
bundle exec rake db:create

# Make sure we are using the most up to date database schema
bundle exec rake db:migrate

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

# Run the web service on container startup $PORT is provided as an environment variable by Cloud Run
bundle exec puma -p $PORT
