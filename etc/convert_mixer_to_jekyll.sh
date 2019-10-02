#!/bin/sh
#
# This script accepts as argument a list of .mixer files,
#
# Example invocation:
#   git grep -l '<mixer template="gw.tmpl">' :*.mixer | xargs ./convert_mixer_to_jekyll.sh


# replace Mixer header by Jekyll header
perl -0 -pi -e 's;^<\?xml version="1\.0" encoding="utf-8"\?>\s*<mixer template="gw.tmpl">\n<mixertitle>\n?([^\n]+)\n?</mixertitle>;---\ntitle: \1\nlayout: default\n---;g' "$@"

# remove footer
perl -pi -e 's;^</mixer>\n;;g' "$@"

#
perl -pi -e 's;<mixer var="relversion"/>;{{site.data.gap.relversion}};g' "$@"
perl -pi -e 's;<mixer var="reldate"/>;{{site.data.gap.reldate}};g' "$@"
perl -pi -e 's;<mixer var="relyear"/>;{{site.data.gap.relyear}};g' "$@"

perl -0 -pi -e 's;<mixer manual="([^"]+)">\s*([^<]+\S)\s*</mixer>;{% include ref.html manual="\1" text="\2" %};g' "$@"

# rename the files
for f in "$@" ; do
    echo "== processing $f =="
    dst=${f/%.mixer/.html}
    rm -f $dst
    git mv $f $dst
    git add $dst
done
