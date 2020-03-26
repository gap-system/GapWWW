#!/bin/sh
# An executable `gap` must be in your $PATH, see the line before the last one
# of this script.

if [ "$#" != "1" ]; then
    echo -n "Usage: generate_package_yml_files_from_PackageInfo_files.g"
    echo    " <path-to-gap-directory>"
    exit 1
fi;

collectionDir='_Packages'
pathToListOfPaths=${collectionDir}'/tmp/__TMP__list_of_paths_to_packageinfo_files.txt'
mkdir -p ${collectionDir}/tmp/
find ${1}/pkg/ -name 'PackageInfo.g' > ${pathToListOfPaths}
gap -q -c "path := \"${pathToListOfPaths}\";" etc/generate_package_yml_files_from_PackageInfo_files.g
rm ${pathToListOfPaths}
