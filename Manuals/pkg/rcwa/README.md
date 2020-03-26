[![Build Status](https://travis-ci.org/gap-packages/rcwa.svg?branch=master)](https://travis-ci.org/gap-packages/rcwa)
[![Code Coverage](https://codecov.io/github/gap-packages/rcwa/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/rcwa)

# RCWA -- [R]esidue-[C]lass-[W]ise [A]ffine groups

## A GAP 4 Package

### Version 4.6.4

Author and Maintainer:  Stefan Kohl, stefan@mcs.st-and.ac.uk


## Abstract

This package for GAP 4 provides implementations of algorithms and methods for
computing  in  certain  infinite  permutation  groups  acting  on  the set of 
integers.  It can be used  to investigate the following  types of groups  and 
many more:

 - Finite groups.
 - Free groups of finite rank.
 - Free products of finitely many finite groups.
 - Direct products of such groups.
 - Wreath products of such groups with finite groups and with (Z,+).
 - Subgroups of any such groups.

Among these groups there are finitely generated groups which are not finitely
presented, and such with  unsolvable membership problem.  Further, any finite
group embeds into some divisible torsion group which RCWA can deal with.

With the help of this package, the author has found  a countable simple group
which is generated  by involutions interchanging disjoint  residue classes of
the integers and which all the above groups embed into.

For details on how to use the RCWA package,  see the package documentation in
the `doc` subdirectory  --  either view its  HTML version (chap0.html) with a 
browser, or its PDF version (manual.pdf) with a PDF viewer.


## Requirements

This version of  RCWA needs  GAP >=4.9.0 in 64-bit mode,  ResClasses >=4.7.0,
GRAPE >=4.7, Polycyclic >=2.11, FR >=2.2.1,  GAPDoc >=1.5.1 and Utils >=0.40.
All required  packages  are already present  in a standard  GAP installation.
RCWA  can  be  used  on  all  platforms  for  which  GAP is available.  It is
completely written in the GAP language  and does neither  contain nor require
external binaries.


## Installation

Like  any  other  GAP  package,   RCWA  is  usually  installed  in  the  pkg/
subdirectory of the GAP distribution.  This is accomplished by extracting the
package archive file  in this directory.  After this you can load the package 
as usual via 

    LoadPackage( "rcwa" );
    
For further advice  on questions  of technical nature  please see the chapter
`Installation and Auxiliary Functions` in the RCWA manual.


## Distribution and Updates

New releases of this package are put online on the package web pages

 - https://gap-packages.github.io/rcwa/
 - https://www.gap-system.org/Packages/rcwa.html

and distributed with GAP.

---

If you use RCWA  in some  of your work,  then please let me know. -- I am
interested  very much in any  applications of this package.   Also please
let me know if you have problems with this package,  or if you find a bug.

