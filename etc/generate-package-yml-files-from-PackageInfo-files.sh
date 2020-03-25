#!/bin/sh
# How to use this:
# - Edit the gapTarballURL variable. Point it to the tarball of a gap release.
# - run this script from the `GapWWW` repo root directory via
#   `./etc/generate-package-yml-files-from-PackageInfo-files.sh`
#
# An executable `gap` must be in your $PATH, see the line before the last one
# of this script.

gapTarballURL='https://files.gap-system.org/gap-4.11/tar.gz/gap-4.11.0.tar.gz'
collectionDir='_Packages'
mkdir ${collectionDir}/tmp
cd ${collectionDir}/tmp
echo "----    Getting the GAP tarball    ----\n"
wget ${gapTarballURL}
echo "----    Unpacking the GAP tarball    ----\n"
tar -xf gap-4.11.0.tar.gz
echo "----    Generating YML files    ----\n"
mv gap-*/pkg .
rm -rf gap-*
cd ../..
find ${collectionDir}/tmp/pkg/ -name 'PackageInfo.g' > ${collectionDir}/tmp/list-of-paths-to-packageinfo-files.txt
# TODO use the gap version from the tar ball?
gap etc/generate-package-yml-files-from-PackageInfo-files.g
rm -rf ${collectionDir}/tmp
