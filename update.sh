#!/bin/sh
../Mixer/mixer.py -f
./sync_mixer_to_jekyll.py
jekyll build
