[![Build Status](https://travis-ci.org/gap-packages/kan.svg?branch=master)](https://travis-ci.org/gap-packages/kan)
[![Code Coverage](https://codecov.io/github/gap-packages/kan/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/kan)

# The GAP 4 package 'KAN' 

## Introduction

This package was conceived as a package for computing induced actions
of categories.  This version only deals with double coset rewriting
systems for finitely presented groups.

## History

 * This package started out as part of Anne Heyworth's thesis in 1999. 
 * The first version on general release was 0.91 in July 2005. 
 * 'Kan' became an accepted package in May 2015. 
 * A more detailed history is included as Chapter 3 of the manual, 
and in the `CHANGES.md` file. 

## Distribution

 * The 'Kan' package is distributed with the accepted GAP packages: see
     <http://www.gap-system.org/Packages/kan.html>
 * It may also be obtained from the GitHub repository at:
     <http://gap-packages.github.io/kan/> 

## Copyright

The 'Kan' package is Copyright {\copyright} Chris Wensley and Anne Heyworth, 
1996--2017. 

'Kan' is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version. 

For details, see <http://www.gnu.org/licenses/gpl.html>

## Installation

 * unpack `kan-<version_number>.tar.gz` in the `pkg` subdirectory 
   of the GAP root directory.
 * From within GAP load the package with:

    gap> LoadPackage("kan");

    true

 * The documentation is in the `doc` subdirectory. 
 * To run the test file read `testall.g` from the `kan/tst/` directory. 

Contact
-------
If you have a question relating to 'Kan', encounter any problems, 
or have a suggestion for extending the package in any way, please 
 - email: c.d.wensley@bangor.ac.uk  
 - or report an issue at: https://github.com/gap-packages/kan/issues/new 