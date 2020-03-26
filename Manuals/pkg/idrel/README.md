[![Build Status](https://travis-ci.org/gap-packages/idrel.svg?branch=master)](https://travis-ci.org/gap-packages/idrel)
[![Code Coverage](https://codecov.io/github/gap-packages/idrel/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/idrel)

# The GAP 4 package 'IdRel'

## Introduction

The IdRel package is designed for computing the identities among relations 
of a group presentation using rewriting, logged rewriting, 
monoid polynomials, module polynomials and Y-sequences.

## History

Version 1.001 of IdRel formed part of Anne Heyworth's PhD thesis in
December 1999.
Version 2.02 was prepared for the GAP 4.4 release in March 2006 
and deposited in the incoming directory on the St Andrews ftp server.
A more detailed history will be included as Chapter 6 of the manual.
IdRel became an accepted package in May 2015. 

## Distribution

The IdRel package is distributed with the accepted GAP packages.
It may also be obtained from the GitHub repository at:
  <http://gap-packages.github.io/idrel/> 

## Copyright

The IdRel package is Copyright {\copyright} Chris Wensley and Anne Heyworth, 
1999--2017. 

IdRel is free software; you can redistribute it and/or modify it 
under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version. 

For details, see <http://www.gnu.org/licenses/gpl.html>. 

## Installation

 * Unpack `idrel-<version_number>.tar.gz` in the `pkg` subdirectory 
   of the GAP root directory.
 * From within GAP load the package with:

    gap> LoadPackage("idrel");

    true

 * The documentation is in the `doc' subdirectory.
 * To run the test file read `testall.g` from the `idrel/tst/` directory. 

## Contact

If you have a question relating to IdRel, encounter any problems, or have a suggestion for extending the package in any way, please 
 * email: c.d.wensley@bangor.ac.uk 
 * or report an issue at the GitHub issue tracker: 
   <https://github.com/gap-packages/idrel/issues/new> 
