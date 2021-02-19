#!/bin/sh
# TODO describe this
# TODO: replace this with a pure GAP script;
# TODO: there are now several similar scripts like this; perhaps we can unify them,
#   by running once and producing a JSON output file(s) (note that
#   python has builtin JSON parsing, but not YAML) then that is run
#   once, and then different python3 scripts produce the Jekyll YAML,
#   or the data needed for releases, or create the manuals update, based
#   on that shared data

FILENAME=`basename ${0}`
SCRIPT=${FILENAME%.sh}

if [ "$#" == "0" ] || [ "$#" -ge "3" ]; then
  echo "Usage: ${SCRIPT}.sh: <gaproot> <release_file>"
  exit 1
fi;

PACKAGEINFO_PATHS="${TMPDIR}/_tmp_packageinfo_paths.tmp"

# TODO: replace this with a 

mkdir -p Manuals/pkg/

# We use '-maxdepth 2' since e.g. some packages contain others (e.g. hap)
find ${1}/pkg -maxdepth 2 -name 'PackageInfo.g' > ${PACKAGEINFO_PATHS}
${1}/bin/gap.sh -A -r -q -x 163 <<GAPInput
path := "${PACKAGEINFO_PATHS}";;
inputStream := InputTextFile(path);;
pathsToPackageInfoFile := ReadAll(inputStream);;
pathsToPackageInfoFile := SplitString(pathsToPackageInfoFile, "\n");;
SortBy(pathsToPackageInfoFile, LowercaseString);
streamFilename := "${2}";;
stream := OutputTextFile(streamFilename, true);;
SetPrintFormattingStatus(stream, false);
for path in pathsToPackageInfoFile do
  NormalizeWhitespace(path);
  Read(path);
  pkg := GAPInfo.PackageInfoCurrent;

  # check if one or several books
  if IsList(pkg.PackageDoc) then
    books := pkg.PackageDoc;
  else
    books := [pkg.PackageDoc];
  fi;
  
  for b in books do
    # Should the documentation be taken from the package release, 
    # or is there a separate archive with the package documentation?
    if not IsBound(b.ArchiveURLSubset) then continue; fi;
    # Get all manuals from the package release stored in the repository
    for a in b.ArchiveURLSubset do
      if IsExistingFile( Concatenation( pkgtmp, "/", dname, "/", a ) ) then
        # FIXME: check the following code, OR just output all the filenames
        # and then us a shell or python script to perform the operations?
      
        # whether a is a directory name or (rarely) a filename, e.g. doc/manual.pdf?
        if Basename(a)=a then
        # directory name or a file in the current directory
        Exec(Concatenation("cd ", pkgtmp, "/", dname, " ; ",
                           "cp -p -fr ", a, " ", pkgdocdir, "/", dname ));
        else
        Exec(Concatenation("cd ", pkgtmp, "/", dname, " ; ",
                           "mkdir -p ", pkgdocdir, "/", dname, "/", Dirname(a), " ; ",
                           "cp -p -fr ", a, " ", pkgdocdir, "/", dname, "/", Dirname(a), "/" ));
        fi;
      else
        Print("WARNING: package ", info.PackageName, ", book ", b.BookName, 
              " has no subdirectory ", dname, "/", a, "\n",
              "         but has ArchiveURLSubset=", b.ArchiveURLSubset, "\n" );
      fi;
    od;
  od;


od;
CloseStream(stream);
QUIT;
GAPInput
rm ${PACKAGEINFO_PATHS}
