#!/bin/sh
set -e

# fetch latest changes
cd /srv/www/www-gap-dev/data/GapWWW
git fetch --all --prune
git checkout --force dev
git reset --hard origin/dev

# add webhook secret
cat /srv/www/www-gap-dev/data/webhook.secret >> .htaccess

# install gems
bundle config set --local path 'vendor/bundle'
bundle install

# run jekyll
bundle exec jekyll build -d /srv/www/www-gap-dev/data/http

# ensure symlinks exist
cd /srv/www/www-gap-dev/data/http
ln -sf ../ForumArchive
ln -sf ../ForumArchive2
