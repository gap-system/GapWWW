[![Build Status](https://travis-ci.org/gap-packages/FactInt.svg?branch=master)](https://travis-ci.org/gap-packages/FactInt)
[![Code Coverage](https://codecov.io/github/gap-packages/FactInt/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/FactInt)

# GAP package FactInt -- Advanced Methods for [Fact]oring [Int]egers

## Abstract

FactInt is a GAP 4 package which provides routines for factoring integers, in
particular:

 - Pollard's p-1
 - Williams' p+1
 - Elliptic Curves Method (ECM)
 - Continued Fraction Algorithm (CFRAC)
 - Multiple Polynomial Quadratic Sieve (MPQS)

It also provides access to  Richard P. Brent's tables  of factors of integers
of the form b^k +/- 1.

   FactInt installs a better method for the operation `Factors` for integers.
For details see the package documentation in the `doc` subdirectory -- either
view  its  HTML  version  (chap0.html)  with  a browser,  or its  PDF version
`manual.pdf` with a PDF viewer.


## Requirements

This Version of FactInt needs at least  GAP >=4.8.8  and GAPDoc >=1.6.  It is
completely written in the  GAP language and does neither contain  nor require
external binaries.


## Installation

Like  any  other  GAP package,   FactInt  must  be  installed  in  the   pkg/ 
subdirectory of the GAP distribution.  This is accomplished by extracting the 
distribution file in this directory. By default, FactInt is autoloaded.  This 
means that it is loaded automatically when you start GAP.


## Distribution and Updates

FactInt is distributed with the main GAP archive.  For package updates between
GAP releases itself check its web page https://gap-packages.github.io/FactInt.

## Feedback

If you have problems with this package, wish to make comments or suggestions,
or if you find bugs, please use https://github.com/gap-packages/FactInt/issues
or contact package maintainers by email.
 
- Author and Maintainer:  Stefan Kohl, stefan@gap-system.org
- Maintainer: Alexander Konovalov, alexander.konovalov@st-andrews.ac.uk