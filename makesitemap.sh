#!/bin/sh

# Use xfig to edit sitemap.fig, then call this script, then the mixer.

fig2dev -L png -m 0.9 sitemap.fig sitemap.png
fig2dev -L map -m 0.9 sitemap.fig sitemap.tmp
./maptoxhtml.py <sitemap.tmp >sitemap.map
rm -f sitemap.tmp


