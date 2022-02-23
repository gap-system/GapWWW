#!/usr/bin/env python3
# Fri, 07 Jan 2022 17:48:04 +0100

# pkglinks.py                                             Frank Lübeck
#
# This script can be called in the
#    - `Manuals` directory of the GAP website
#    - the GAP root of a GAP distribution
#
# It searches in all html-files in this directory and subdirectories
# for links to pkg/*/doc/...  
# If the `*` match in this path does not exist the script guesses
# which existing subdirectory might work instead and adds a corresponding
# symbolic link.

import os, fnmatch, re
from bs4 import BeautifulSoup as bs

# collect links to pkg/... directories in all subdirectories
linkdirs = []
count = {}
for r,d,f in os.walk("."):
  for fn in fnmatch.filter(f, "*.html"):
    pfn = os.path.join(r, fn)
    print('Scanning '+pfn)
    of = open(pfn, "rb")
    s = bs(of.read(), "html.parser");
    of.close()
    links = s.find_all("a")
    for t in links:
      url = t.get("href", None)
      if url != None:
        a = re.search(r'(?<=/pkg/)[^/]+', url)
        if a:
          nam = a.group(0)
          if not nam in linkdirs:
            linkdirs.append(nam)
            count[nam] = 1
          else:
            count[nam] += 1

print("Found links to the following pkg/... directories:")
for nam in linkdirs:
  print("  "+nam+" ("+str(count[nam])+" times)")

# add appropriate symbolic links
def normnam(s):
  s = s.lower()
  s = s.replace(".dev", "")
  s = s.replace("-dev", "")
  for a in "-.0123456789":
    s = s.replace(a, "")
  return s

def longestmatch(s, t):
  ls = normnam(s)
  lt = normnam(t)
  if ls == lt:
    return 1000;
  l = 0
  while l <= len(ls) and l <= len(lt) and ls[:l] == lt[:l]:
    l += 1
  return l-1

os.chdir("pkg")
f = open("RemoveTemporarySymLinks", "w")
dnams = os.listdir(".")
for nam in linkdirs:
  if not nam in dnams:
    best = ""
    max = 0
    for dn in dnams:
      m = longestmatch(dn, nam)
      if m > max:
        max = m
        best = dn
    if best in dnams:
      print(f"Linking {best} to {nam} ...")
      f.write("rm -f "+nam+"\n")
      os.symlink(best, nam)

f.write("rm -f RemoveTemporarySymLinks\n");
f.close()
os.chmod("RemoveTemporarySymLinks", 0o755);

