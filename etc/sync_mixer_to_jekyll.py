#!/usr/bin/env python3
#
# TODO/FIXME: this script is meant only for use during the ongoing conversion
# to Jekyll, and should be retired once that conversion is complete.
#
import sys
import os
import re

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
