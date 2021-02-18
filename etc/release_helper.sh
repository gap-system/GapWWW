#!/bin/sh
# This script is called by... as part of updating GapWWW for a new GAP release

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
inputStream := InputTextFile(path);
pathsToPackageInfoFile := ReadAll(inputStream);
pathsToPackageInfoFile := SplitString(pathsToPackageInfoFile, "\n");
SortBy(pathsToPackageInfoFile, LowercaseString);
streamFilename := out;
stream := OutputTextFile(streamFilename, true);
SetPrintFormattingStatus(stream, false);
for path in pathsToPackageInfoFile do
  NormalizeWhitespace(path);
  Read(path);
  pkg := GAPInfo.PackageInfoCurrent;
  dirname := SplitString(path, "/");
  if Length(dirname) >= 2 then
    dirname := dirname[Length(dirname) - 1];
  else
    Error("invalid <path> argument");
  fi;
  AppendTo(stream, "\n  \"", pkg.PackageName, "\": { ");
  AppendTo(stream, StringFormatted("filename: \"{}\", version: \"{}\", date: \"{}\", ",
                           LowercaseString(pkg.PackageName), pkg.Version, pkg.Date));
  AppendTo(stream, "description: \"", pkg.Subtitle, "\" }");
od;
CloseStream(stream);
QUIT;
GAPInput
rm ${PACKAGEINFO_PATHS}
