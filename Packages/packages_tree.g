# This script generate the source for the package list in the left navigation bar
# Start GAP release with -r -A and read this file. Then paste the output into 
# `GapWWW/Packages/tree`.
for pkg in SortedList(RecNames(GAPInfo.PackagesInfo)) do
  Print("  <entry file=\"", pkg, ".html\">",
        GAPInfo.PackagesInfo.(pkg)[1].PackageName,
        "</entry>\n");
od;

QUIT;
