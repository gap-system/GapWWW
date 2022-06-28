#!/bin/sh
set -e

# fetch latest changes
cd $HOME/GapWWW
git fetch --all --prune
git checkout gh-pages
git reset --hard origin/gh-pages

# install prerequisites if necessary
bundle config set --local path 'vendor/bundle'
bundle install

# run jekyll
bundle exec jekyll build -d /srv/www/www.gap-system.org
