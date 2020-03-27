#!/bin/sh
# An executable `gap` must be in your $PATH, see the line before the last one
# of this script.

if [ "$#" != "1" ]; then
    echo -n "Usage: generate_package_yml_files_from_PackageInfo_files.g"
    echo    " <path-to-gap-directory>"
    exit 1
fi;

if [ ! -d ${1}/pkg ]; then
    echo "Directory not found: "${1}/pkg
    exit 1
fi

collectionDir='_Packages'
pathToListOfPaths=${collectionDir}'/__tmp__list_of_paths_to_packageinfo_files.txt'
if [ -e ${pathToListOfPaths} ]; then
    echo "File or directory already exists: "${pathToListOfPaths}
    exit 1
fi

# We use the maxdepth option since e.g. the hap package contains other gap
# packages
find ${1}/pkg/ -maxdepth 2 -name 'PackageInfo.g' > ${pathToListOfPaths}
gap -q -c "path := \"${pathToListOfPaths}\";" etc/generate_package_yml_files_from_PackageInfo_files.g
rm ${pathToListOfPaths}
