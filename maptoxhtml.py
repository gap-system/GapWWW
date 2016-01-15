#!/usr/bin/env python

# Converts an HTML 3.2 file coming from "fig2dev -L map" into a subtree
# of an XML document conforming to xhtml 1.0, which includes a graphic
# together with the links coming from the comment fields.
# Reads from stdin, writes to stdout.

import sys,os,string,re

ll = sys.stdin.readlines()

# Find line with image:
i = 0
while ll[i][:4] != '<IMG': i += 1

e = re.compile(r'^<IMG SRC="(.*)\.gif" USEMAP="#(.*)">$')
m = e.match(ll[i])
if not(m):
    sys.stdout.write("Error: IMG line incorrect.\n")
    sys.exit(1)
print '<?xml version="1.0" encoding="ISO-8859-1"?>'
print '<!-- DO NOT EDIT! This was generated automatically by maptoxhtml.py. -->'
print '<mixer>'
print '<img src="'+m.group(1)+'.png" usemap="#'+m.group(2)+'" alt="sitemap" />'
print '<map name="'+m.group(2)+'" id="'+m.group(2)+'">'
i += 2
e = re.compile(r'^<AREA COORDS="(.*)>$')
m = e.match(ll[i])
while m:
    print '<area coords="'+m.group(1)+' />'
    i += 1
    m = e.match(ll[i])
print '</map>'
print '</mixer>'

