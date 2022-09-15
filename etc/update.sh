#!/bin/sh
set -e

# fetch latest changes
cd /srv/www/www-gap-systems/data/GapWWW
git fetch --all --prune
git checkout master
git reset --hard origin/master

# add webhook secret
cat /srv/www/www-gap-systems/data/webhook.secret >> .htaccess

# install gems
bundle config set --local path 'vendor/bundle'
bundle install

# run jekyll
bundle exec jekyll build -d /srv/www/www-gap-systems/data/http

# ensure symlinks exist
cd /srv/www/www-gap-systems/data/http
ln -sf ../ForumArchive
ln -sf ../ForumArchive2
