# GapWWW

[![Build Status](https://travis-ci.com/gap-system/GapWWW.svg?branch=master)](https://travis-ci.com/gap-system/GapWWW)

This is the source repository for the GAP website <https://www.gap-system.org>.

The GAP website is NOT hosted on GitHub pages, and therefore there is NO
branch named `gh-pages` here. We host it elsewhere, but we use GitHub for
collaborative work on the website. We welcome contributions ranging from 
fixed typos and updated details to suggestions regarding the structure of 
the website and its improved look.

For small improvements (e.g. correcting details and fixing typos), the 
procedure is as simple as just submitting an issue or pull request here.
Please take into account that some files, in particular package YAML
files `Packages/<pkgname>.html` are generated automatically from the
meta-date in `PackageInfo.g` files. Incorrect information there should 
not be changed via pull requests, but reported to package authors instead.
In doubt, please submit an issue before making a pull request, and we 
will be able to advise on further steps.

For larger changes, it will be useful to build a local version of the GAP
website first. This requires use of [Jekyll](https://jekyllrb.com).
