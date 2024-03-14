#!/bin/sh

echo "* * * * * * * * * * W A R N I N G * * * * * * * * * *"
echo "The GAP distribution now includes bin/BuildPackages.sh,"
echo "a script which can be started from the pkg directory via"
echo "../bin/BuildPackages.sh and will attempt to build as many"
echo "packages as possible. It replaces the InstPackages.sh script"
echo "which was not a part of the GAP distribution and had to be"
echo "downloaded separately from the GAP website. The new script"
echo "is more robust and simplifies adding new packages with"
echo "binaries, as it requires no adjustments if the new package"
echo "supports the standard ./configure; make build procedure."
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * *"
