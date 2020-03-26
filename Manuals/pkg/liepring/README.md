[![Build Status](https://travis-ci.org/gap-packages/liepring.svg?branch=master)](https://travis-ci.org/gap-packages/liepring)
[![Code Coverage](https://codecov.io/github/gap-packages/liepring/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/liepring)

# LiePRing

LiePRing is a GAP4 package. Its main objective is to provide
access to the nilpotent Lie rings of order p^n for p>2 and n<=7.

REMARK: this package is written for GAP4.4 (and higher versions);
the package LieRing is required.


## Installation

To install the package LiePRing move the file `liepring-XX.tar.gz`
(or any other archive containing it) into the `pkg` directory.
Usually this will be the `pkg` subdirectory in your GAP4 installation.
However, it is also possible to have a `pkg` subdirectory in a 
different place, see the section `Installing GAP Packages` of the 
GAP4 reference manual for more information.
Then simply unpack `liepring-XX.tar.gz` and your installation is
complete.

In GAP, issue 

    gap> LoadPackage( "liepring" );

to load the package.
             

## Documentation

The manual of LiePRing is contained in the `liepring/doc` directory.

