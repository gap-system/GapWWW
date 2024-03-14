#!/bin/sh
#                                                           Frank Lübeck
#
# Use this script inside the $GAPROOT directory (the top directory
# containing 'bin', 'lib', 'pkg' and so on as subdirectories) to 
# generate a workspace file:
#     bin/wsgap4

echo Creating new workspace file ... 

# the -r option avoids to store user specific settings in the workspace
bin/gap.sh -r <<EOF

# load here all packages you want to include in the standard workspace
LoadPackage("EDIM");

# load help book infos with a dummy help query
??blablfdfhskhks

# a small trick to make everything sensible available to the TAB completion
function() local a; for a in NamesGVars() do if ISB_GVAR(a) then
VAL_GVAR(a); fi;od;end;
last();

# save the workspace
SaveWorkspace("bin/wsgap4");

quit;
EOF

echo 
echo -------------------------------------------------------------------
echo You can use the just produced workspace in
echo    bin/wsgap
echo when starting GAP with the -L option.
echo
echo Do not forget to regenerate the workspace after updating GAP or packages!
echo 
echo The following script starts GAP with this workspace:
echo
echo '#!/bin/sh'
echo `pwd`'/bin/gap.sh -L '`pwd`'/bin/wsgap4   $*'
echo

