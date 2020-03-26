[![Build Status](https://travis-ci.com/gap-packages/intpic.svg?branch=master)](https://travis-ci.com/gap-packages/intpic)
[![Code Coverage](https://codecov.io/github/gap-packages/intpic/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/intpic)

IntPic
======

`IntPic` is a GAP package that provides a simple way of getting a pictorial view of sets of integers.

Introduction
------------

The aim of the package is to
help visualising sets of integers and to create publication quality pictures
of these sets. 

There is a manual in the sub-directory `doc` written using the GAP package
gapdoc which contains several examples illustrating its usage. In particular,
it is illustrated how the pictures produced (either the tizk code or the
pictures in pdf) can b eeasily included in a LaTeX document.

If you have used this package, please let me know by sending me an email. If
you have any suggestion on how to improve it, I would very much appreciate if
you send me an email.

Manuel Delgado			<mdelgado@fc.up.pt>

Contents
--------
With this version you should have obtained the following files and
directories:

| File/directory | Description |
|:-----|:------|
|README.md |   this file|
|EXAMPLES|	some examples|
|CHANGELOG|	changelog|
|LICENSE|	Licensing information|
|doc  |	the manual|
|gap  |the GAP code|
|tst  |	a test file|
|images	|images produced using the package and used in the manual|
|init.g| the file that initializes this package|
|read.g	 |   the file that reads in the package|
|PackageInfo.g	| information file for automatic processing|
|version	|the version number|

Usage
-----
The package shall be distributed with the main GAP archive. In this case, in
order to use it you just have to start GAP and type

      LoadPackage( "intpic" );

------------------------------
------------------------------
For updates between releases of GAP itself or in case it is not distributed
with the main GAP archive, check the package Web page

    https://gap-packages.github.io/intpic/

For the development version, please visit the repository in GitHub (https://github.com/gap-packages/intpic/)

You may get `IntPic` as a compressed tar archive (file name ends with
.tar.gz). Use the appropriate command on your system to unpack the
archive.

On UNIX systems the compressed tar archive may be unpacked by

    tar xzf intpic-<version>.tar.gz

or, if tar on your system does not understand the option z, by

    gunzip intpic-<version>.tar.gz
    tar xf intpic-<version>.tar

which will in each case unpack the code into a directory `intpic`
in the current directory. We assume that the current directory is the
directory /usr/local/lib/gap4r8/pkg/.

Installation
------------

You may have to start GAP with the -l option, for instance,

    gap -l "/usr/local/lib/gap4r8"

Then try the following

    LoadPackage( "intpic" );

Good luck!
If the load has been successful the package banner will be shown.


If you use a LINUX system, you may want to, in order to save typing, write
aliases:

in the file `.bash_aliases` (or something equivalent, maybe with another syntax):

    alias gap='gap -l "/usr/local/lib/gap4r8;"'

and in the file `.gap/gaprc`

    LoadPackage( "intpic" );

----------

In other systems, there are equivalent ways to do the same.



IntPic is free software you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2 of the License, or (at your
option) any later version. For details, see the file `GPL` distributed
as part of this package or see the FSF's own site.
