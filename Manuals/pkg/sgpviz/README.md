[![Build Status](https://travis-ci.org/gap-packages/sgpviz.svg?branch=master)](https://travis-ci.org/gap-packages/sgpviz)
[![Code Coverage](https://codecov.io/github/gap-packages/sgpviz/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/sgpviz)

SgpViz
======

`SgpViz` is a GAP package for (finite) semigroup visualisation.

Introduction
------------

This is release 0.999.4 of  the package `SgpViz`.

The features of this package include

- drawing the D-Classes of a semigroup and the D-Class of an element of a semigroup;
- drawing the Schutzenberger graphs of an inverse semigroup;
- a Tcl/Tk interface to specify a semigroup;

There is a manual in the sub-directory `doc` written using the GAP package
gapdoc which describes the available functions in detail. The pdf, html
versions of the manual are also available there.

The current maintainer of the package is Manuel Delgado <mdelgado@fc.up.pt>.

In many aspects the present package was superseeded by the package "semigroups" by James Mitchel. I encourage you to use it instead of SgpViz. While there are some features not covered by the "semigroups" package, an effort will be made for keeping SgpViz working.
If you  have found important features missing or if there is a bug, I would appreciate it very much if you send me an email.

Contents
--------
With this version you should have obtained the following files and directories:

| File/directory | Description |
|:-----|:------|
|README.md|   this file|
|EXAMPLES|	some examples|
|CHANGES|	changelog|
|LICENSE|	Licensing information|
|doc  |	the manual|
|gap  |the GAP code|
|tst  |	a test file|
|init.g| the file that initializes this package|
|read.g |         		the file that reads in the package|
|PackageInfo.g	| information file for automatic processing|
|version	|the version number|

Usage
-----
The package shall be distributed with the main GAP archive. In this case, in
order to use it you just have to start GAP and type

      LoadPackage( "sgpviz" );

------------------------------
------------------------------
For updates between releases of GAP itself or in case it is not distributed
with the main GAP archive, check the package Web page

    https://gap-packages.github.io/sgpviz/

For the development version, please visit the repository in GitHub (https://github.com/gap-packages/sgpviz/)

You may get `SgpViz` as a compressed tar archive (file name ends with
.tar.gz). Use the appropriate command on your system to unpack the
archive.

On UNIX systems the compressed tar archive may be unpacked by

    tar xzf sgpviz-<version>.tar.gz

or, if tar on your system does not understand the option z, by

    gunzip sgpviz-<version>.tar.gz
    tar xf sgpviz-<version>.tar

which will in each case unpack the code into a directory `sgpviz`
in the current directory. We assume that the current directory is the
directory /usr/local/lib/gap-4.x.x/pkg/.

Installation
------------

### Important:

This package needs the package `Automata` (http://www.gap-system.org/~gap/Packages/automata.html).


You may have to start GAP with the -l option, for instance,

    gap -l "/usr/local/lib/gap-4.x.x"

Then try the following

    gap> LoadPackage( "sgpviz" ); 
    true
    gap>

Good luck!

If you use a LINUX system, you may have to, in order to save typing, write
aliases: 

in the file `.bash_aliases` (or something equivalent, maybe with another syntax): 

    alias gap='gap -l "/usr/local/lib/gap-4.x.x;"'

and in the file `.gap/gaprc`

    LoadPackage( "sgpviz" ); 

In order to have automatic visualisations and not just to produce the dot code to be visualised by any other means, GraphViz (http://www.graphviz.org/) should be installed.

In order to be able to use a GUI to give automata or semigroups, Tcl/Tk should also be installed.

----------
In other systems, there are equivalent ways to do the same.

SgpViz is free software you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2 of the License, or (at your
option) any later version. For details, see the file `GPL` distributed
as part of this package or see the FSF's own site.
