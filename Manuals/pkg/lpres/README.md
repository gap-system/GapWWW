[![Build Status](https://travis-ci.org/gap-packages/lpres.svg?branch=master)](https://travis-ci.org/gap-packages/lpres)
[![Code Coverage](https://codecov.io/github/gap-packages/lpres/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/lpres)

# The GAP 4 package `lpres`

## Introduction

This is the package `lpres` written for GAP 4. It provides a first
construction of finitely L-presented groups and a nilpotent quotient
algorithm for L-presented groups.

The features of this package include

  - creating an L-presented group as new gap object,

  - computing nilpotent quotients of L-presented groups and epimorphisms
    from the L-presented group onto its nilpotent quotients,

  - computing the abelian invariants of an L-presented group,

  - computing finite-index subgroups and if possible their L-presentation

  - approximating the Schur multiplier of L-presented groups.

There is a manual in the subdirectory `doc` written in plain TeX which
describes the functions available.

If you have found a bug or any features missing please let me know
(Laurent Bartholdi, laurent.bartholdi@gmail.com)


## Contents

With this version you should have obtained the following files and
directories:

    README.lpres    this file
    
    init.g          the file that initializes this package
    
    read.g          the file that reads in the package        
    
    makedoc.g       the file used to compile the documentation
    
    PackageInfo.g   the file for the new package loading mechanism
    
    doc             the manual
    
    gap             the GAP code


## Installation

Make sure that the GAP 4 packages Polycyclic and FGA are installed. It
suffices to unpack the package in the `pkg` directory and load the
package from within gap using `LoadPackage("lpres");`.


## Test Files

The lpres package can be tested with

    ReadPackage("lpres","tst/testall.g");


## Compiling the Manual

If you obtained the package from its git repository, you have to compile
the manual. For this, enter the directory of lpres (the one containing
the file `makedoc.g`) and run `gap makedoc.g`.

## BugFixes/Changes/Features Added

* Version 0.1.0:
  - maintenance taken over by Laurent Bartholdi
