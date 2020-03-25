$GAPROOT should be the path to a gap installation
From the root directory of the GapWWW repo:
```
mkdir _PackagesTest/tmp
cp -r $GAPROOT/pkg _PackagesTest/tmp/
find _PackagesTest/tmp/pkg/ -name 'PackageInfo.g' > _PackagesTest/tmp/list-of-paths-to-packageinfo-files.txt
gap etc/generate-package-yml-files-from-PackageInfo-files.g
```
