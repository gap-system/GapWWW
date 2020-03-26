#!/usr/bin/env bash
# Example invocation:  etc/extract-manuals.sh $GAPROOT

set -e

# TODO: add argument validation
gaproot=$1

# ensure Manuals directory exists and switch to it
mkdir -p Manuals
cd Manuals
basedir=$PWD

# remove old content
rm -rf doc pkg

# copy the GAP manuals
cp -r ${gaproot}/doc .

# copy package manuals into "normalized" dirs
cd ${gaproot}/pkg
for dir in */PackageInfo.g ; do
  dir=$(dirname ${dir})
  # transform into "canonical" name: remove everything after '-', convert to lowercase
  pkg=$(echo ${dir%-*} | tr '[:upper:]' '[:lower:]')
  
  echo "Processing ${dir}"
  # TODO: we really should extract the package name from PackageInfo.g;
  # and also the manual directory should be extracted from there.
  # TODO: also extract the README name!
  mkdir -p ${basedir}/pkg/${pkg}
  cp -r ${dir}/README* ${dir}/doc ${basedir}/pkg/${pkg}/
  # TODO: copy htm dir
done
cd ${basedir}

# remove unwanted stuff
find . -name clean | xargs rm
find . -name make_doc | xargs rm
find . -name Makefile | xargs rm
find . -name buildman.config | xargs rm
find . -name buildman.pe | xargs rm
find -E . -regex '.*\.(autodoc|aux|bbl|bib|blg|brf|bst|dvi|g|gi|idx|ilg|ind|lab|log|msk|mst|out|pdf|pnr|ps|six|tex|toc|tst|txt|xml)' | xargs rm

# add all the new data
git add doc pkg
