#!/bin/sh
collectionDir=_PackagesTest
mkdir ${collectionDir}/tmp
cd ${collectionDir}/tmp
echo "Getting the GAP tarball.\n"
wget https://www.gap-system.org/pub/gap/gap-4.11/tar.gz/gap-4.11.0.tar.gz
echo "Unpacking the GAP tarball.\n"
tar -xf gap-4.11.0.tar.gz
echo "Generating YML files.\n"
mv gap-*/pkg .
rm -rf gap-*
cd ../..
find ${collectionDir}/tmp/pkg/ -name 'PackageInfo.g' > ${collectionDir}/tmp/list-of-paths-to-packageinfo-files.txt
# TODO use the gap version from the tar ball?
gap etc/generate-package-yml-files-from-PackageInfo-files.g
rm -rf ${collectionDir}/tmp
