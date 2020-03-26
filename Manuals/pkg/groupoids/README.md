[![Build Status](https://travis-ci.org/gap-packages/groupoids.svg?branch=master)](https://travis-ci.org/gap-packages/groupoids)
[![Code Coverage](https://codecov.io/github/gap-packages/groupoids/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/groupoids)

# The GAP 4 package 'groupoids' 

## Introduction

This package allows for the computation of finite groupoids: both connected, and with several components.  Graphs of groups and graphs of groupoids are also constructed, allowing the calculation of normal forms for Free Products with Amalgamation and for HNN extensions when the initial groups have rewriting systems.  This package was, until very recently, named Gpd. 

## History

 * Version 1.001 was called 'GraphGpd', and formed part of Emma Moore's PhD thesis in December 2000.
 * Version 1.002 was prepared for the GAP 4.4 release in January 2004, and deposited in the incoming directory on the St Andrews ftp server.
 * In the spring of 2006 the package was renamed 'Gpd' and extensively rewritten, with documentation in GAPDoc format.
 * Version 1.01 was deposited in June 2006. 
 * Gpd became an accepted GAP package in May 2015. 
(In the latest temporary versions there have been a number of changes of function name, such as IsDigraph becoming GpdIsDigraph. 
This is in order to avoid conflicts with the new Digraphs package.
Further changes will be made once the Digraphs package becomes part of the GAP distribution.) 
 * In April 2017 the package was renamed again as 'groupoids', version 1.51. 
A more detailed history is included as Chapter 8 of the manual, and in the file `CHANGES.md`.

## Distribution
------------
 * The 'groupoids' package is distributed with the accepted GAP packages: see
     <http://www.gap-system.org/Packages/groupoids.html>
 * It may also be obtained from the GitHub repository at:  
  <https://gap-packages.github.io/groupoids/>

## Copyright

The groupoids package is Copyright {\copyright} Chris Wensley and Emma Moore, 2000-2017. 

'groupoids' is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 

For details, see: <http://www.gnu.org/licenses/gpl.html>

## Installation

 * unpack `groupoids-<version_number>.tar.gz' in the `pkg` subdirectory of the GAP root directory.
 * From within GAP load the package with:

    gap> LoadPackage("groupoids");

    true

 * The documentation is in the `doc` subdirectory.
 * To run the test file read `testall.g` from the `groupoids/tst/` directory. 

Contact
-------
If you have a question relating to groupoids, encounter any problems, or have a suggestion for extending the package in any way, please 
 * email c.d.wensley@bangor.ac.uk 
 * or report an issue at https://github.com/gap-packages/groupoids/issues/new 

