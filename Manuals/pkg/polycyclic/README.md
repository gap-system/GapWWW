[![Build Status](https://travis-ci.org/gap-packages/polycyclic.svg?branch=master)](https://travis-ci.org/gap-packages/polycyclic)
[![Code Coverage](https://codecov.io/github/gap-packages/polycyclic/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/polycyclic)

The GAP 4 package `Polycyclic'
==============================

Introduction
------------

This is the package `Polycyclic` written for GAP 4.  It provides a
basis for working with polycyclic groups defined by polycyclic
presentations.

To have the full functionality of the package available you need at
least GAP version 4.5 and the GAP 4 package Alnuth and its dependencies
must be installed.

The features of this package include

  - creating a polycyclic group from a polycyclic presentation 

  - arithmetic in a polycyclic group

  - computation with subgroups and factor groups of a polycyclic group

  - computation of standard subgroup series such as the derived 
    series, the lower central series

  - computation of the first and second cohomology 

  - computation of group extensions

  - computation of normalizers and centralizers

  - solutions to the conjugacy problems for elements and subgroups

  - computation of torsion and various finite subgroups

  - computation of various subgroups of finite index

  - computation of the Schur multiplicator, the non-abelian
    exterior square and the non-abelian tenor square

There is a manual in the subdirectory `doc` which describes the
available functions in detail.

If you have used `Polycyclic`, and found important features missing
or if there is a bug, we would appreciate it very much  if you could
report this via <https://github.com/gap-packages/polycyclic/issues>,
or by sending us an email.
 - Bettina Eick  <beick@tu-bs.de>
 - Max Horn      <max.horn@uni-siegen.de>


Contents
--------

With this version you should have obtained the following files and
directories:

- `README`:         this file
- `init.g`:         the file that initializes this package
- `read.g`:         the file that reads in the package        
- `PackageInfo.g`:  the file for the new package loading mechanism
- `doc`:            directory containing the manual
- `gap`:            directory containing the GAP code, it contains:
  - `action`:   actions of polycyclic groups and orbit-stabilizer
  - `basic`:    basic stuff for pcp groups
  - `cohom`:    cohomology for pcp groups
  - `exam`:     examples of pcp groups
  - `matrep`:   matrix representations for pcp groups
  - `matrix`:   basic stuff for matrices and lattices
  - `pcpgrp`:   higher level functions for pcp groups



Installation
------------

Make sure that the GAP 4 package Alnuth is installed to  have the full
range of methods available in polycyclic.

There are two ways of installing the package.  If you have permission
to add files to the installation directory of GAP 4 on your system,
you may install polycyclic in the `pkg` subdirectory of the GAP
installation tree.  If you do not, you can also install polycyclic in
a directory where you have write permissions.  For general advice, see
also the GAP 4 manual about the installation of GAP packages.


### Installation in the GAP 4 pkg subdirectory on a Unix system.

We assume that the archive file polycyclic.tar.gz or
polycyclic.tar is present in pkg and that the current directory is
pkg.  All that needs to be done is to unpack the archive.

    tar xzf polycyclic.tar.gz 

The tar-command has unpacked the code into a directory called
`polycyclic` in the current directory. You can check if GAP
recognizes the polycyclic package by starting GAP and doing the
following:

    $ gap4
    [... startup messages ...]
    gap> LoadPackage("polycyclic");
    true
    gap>     


### Installation in a private directory

Let's say you would like to install polycyclic in a directory
called mygap.  Create a subdirectory `pkg` in mygap and move the
polycyclic archive into that subdirectory.

    cd mygap
    mkdir pkg
    mv polycyclic.tar.gz pkg
    cd pkg
    tar xzf polycyclic.tar.gz

The tar-command has unpacked the code into a directory called
`polycyclic` in the current directory. You can check if GAP
recognizes the polycyclic package by starting GAP and doing the
following.  GAP needs to be told that it should scan the directory
mygap/pkg for GAP packages.  This is achieved by calling gap with
the option -l.  Note the semicolon and the single quotes.

    $ gap4 -l ';mygap/'
    [... startup messages ...]
    gap> LoadPackage("polycyclic");
    true
    gap> 
