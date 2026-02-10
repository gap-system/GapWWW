#!/bin/sh
set -ex

# fetch latest changes
cd ~/data/GapWWW
git fetch --all --prune
git checkout --force master
git reset --hard origin/master

# add webhook secret
cat ~/data/webhook.secret >> .htaccess

# install gems
bundle config set --local path 'vendor/bundle'
bundle install

# run jekyll
bundle exec jekyll build -d ~/data/http

# ensure symlinks exist
cd ~/data/http
ln -sf ../ForumArchive
ln -sf ../ForumArchive2
