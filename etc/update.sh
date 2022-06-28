#!/bin/sh
set -e

# fetch latest changes
cd $HOME/GapWWW
git fetch --all --prune
git checkout master
git reset --hard origin/master

# install prerequisites if necessary
bundle config set --local path 'vendor/bundle'
bundle install

# run jekyll
bundle exec jekyll build -d /srv/www/www.gap-system.org
