#!/usr/bin/env python3
#
# TODO/FIXME: this script is meant only for use during the ongoing conversion
# to Jekyll, and should be retired once that conversion is complete.
#
import sys
import os
import re

# sync lib/AllLinksOfAllHelpSections.data to _data/help.yml
# TODO: in the future, this script here should be rendered unnecessary by
# adapting the script which generates AllLinksOfAllHelpSections.data to
# directly produce `_data/help.yml`
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
        

input = 'lib/config'
output = '_data/gap.yml'
with open(input, "r") as instream, open(output, "w") as outstream:
    line = instream.readline()
    while line:
        line = re.sub(r"^([A-Za-z0-9]+) = ", r"\1: ", line)
        try:
            outstream.write(line)
        except:
            print("error on line: ", line)
        line = instream.readline()
