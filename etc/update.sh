#!/bin/sh
python2 ../Mixer/mixer.py -f
etc/sync_mixer_to_jekyll.py
jekyll build
