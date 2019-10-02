#!/usr/bin/env python3
import sys
import os

# sync lib/AllLinksOfAllHelpSections.data to _data/help.yml
input = 'lib/AllLinksOfAllHelpSections.data'
output = '_data/help.yml'
with open(input, "r") as instream, open(output, "w") as outstream:
    outstream.write('---\n')
    line = instream.readline()
    while line:
        # TODO: escape ' in the input
        data = line.split("|")
        if len(data) < 3:
            line = line.rstrip() + instream.readline()
            data = line.split("|")
        
        try:
            outstream.write(repr(data[0]) + ": " + repr(data[1]) + "  # " + data[2])
        except:
            print("error on line: ", line)
        line = instream.readline()
        
        

# TODO: sync lib/config to _data/gap.yml
