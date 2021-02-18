#!/bin/sh

# Script to regenerate the information in the _Packages directory from the
# PackageInfo.g files of the packages contained in the directory specified
# by the first argument.
#
# The script first finds all the PackageInfo.g files with the `find` command.
# The script then calls a GAP file of the same name (ending .g rather than .sh)
# to process the PackageInfo.g files and output the new files into _Packages.

FILENAME=`basename ${0}`
SCRIPT=${FILENAME%.sh}

if [ "$#" == "0" ] || [ "$#" -ge "3" ]; then
  echo "Usage: ${SCRIPT}.sh: <pkg-dir> [gap-exe (default: gap)]"
  exit 1
fi;

PKG_DIR=${1} 
if [ "${#}" == "2" ]; then
  GAP_EXE=${2}
else
  GAP_EXE="gap"
fi

if [ ! -d ${1} ]; then
  echo "<pkg-dir> is not a directory: ${PKG_DIR}"
  exit 2
fi

PACKAGEINFO_PATHS="${TMPDIR}/_tmp_packageinfo_paths.tmp"

# We use '-maxdepth 2' since e.g. some packages contain others (e.g. hap)
find ${PKG_DIR} -maxdepth 2 -name 'PackageInfo.g' > ${PACKAGEINFO_PATHS}
${GAP_EXE} -A -r -q -x 163 <<GAPInput
path := "${PACKAGEINFO_PATHS}";;
Read("etc/${SCRIPT}.g");
GAPInput
rm ${PACKAGEINFO_PATHS}
