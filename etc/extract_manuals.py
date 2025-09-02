#!/usr/bin/env python3
#
# This script takes the path of a GAP directory containing a pkg subdirectory
# from which to extract packages; and a json file which contains metadata for
# all packages in the given GAP directory (i.e., a package-info.json, as
# shipped with GAP releases starting with GAP 4.11.1)
#
# It then extracts all GAP and package manuals, and copies them into a
# directory called `Manuals` in the current working directory, for use
# on the GAP website.
import json
import os
import re
import shutil

from utils import *

if len(sys.argv) != 3:
    error(f"usage: {sys.argv[0]} <gaproot> <json>")

gaproot = sys.argv[1]
jsonfile = sys.argv[2]
dstdir = "Manuals"

if not os.path.isdir(gaproot):
    error(f"{gaproot} is not a directory")
if not os.path.isfile(jsonfile):
    error(f"{jsonfile} is not a file")
with open(jsonfile, "r") as f:
    pkgs = json.load(f)

# create the destination director if necessary
os.makedirs(dstdir, exist_ok=True)

notice("copying the GAP manuals")
shutil.copytree(os.path.join(gaproot, "doc"), os.path.join(dstdir, "doc"))

# iterate over all packages and their descriptions
for k, v in pkgs.items():
    # extract the name of package directory
    notice("processing " + v["PackageName"])
    pkgsrcdir = os.path.join(gaproot, "pkg", v["PackageName"].lower())
    if not os.path.isdir(pkgsrcdir):
        error(f"{pkgsrcdir} is not a directory")
    pkgdstdir = os.path.join(dstdir, "pkg", v["PackageName"].lower())
    os.makedirs(pkgdstdir, exist_ok=True)
    docpaths = set()
    for b in v["PackageDoc"]:
        docpaths = docpaths.union(b["ArchiveURLSubset"])
    for p in docpaths:
        ps = os.path.join(pkgsrcdir, p)
        pd = os.path.join(pkgdstdir, p)
        if os.path.isdir(ps):
            print(f"  copying dir {ps} to {pd}")
            shutil.copytree(ps, pd)
        elif os.path.isfile(ps):
            print(f"  copying file {ps} to {pd}")
            os.makedirs(os.path.dirname(pd), exist_ok=True)
            shutil.copy(ps, pd)
        else:
            error(f"{ps} is neither a directory nor a file")
