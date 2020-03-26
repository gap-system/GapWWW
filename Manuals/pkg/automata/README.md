
The GAP 4 package `automata'
==================================

Introduction
------------

This is release 1.14 of  the package `automata'.

The features of this package include

         - computing a rational expression for the language recognized by a
           finite automaton;
         - compute an automaton for the language given by a rational
           expression;
         - minimalize a finite automaton;
         - has some features (using the external program GraphViz) to
           visualize automata;

There is a manual in the sub-directory 'doc' written using the GAP package
gapdoc which describes the available functions in detail. The dvi, pdf, html
versions of the manual are also available there.

The current maintainers of the package are:

    Manuel Delgado   <mdelgado@fc.up.pt>
    Steve Linton     <steve.linton@st-andrews.ac.uk>

If you  have found important features missing or if there is a bug, we would appreciate it very much if you send us an email.

Contents
--------
With this version you should have obtained the following files and
directories:

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

      LoadPackage( "automata" );

------------------------------
------------------------------
For updates between releases of GAP itself or in case it is not distributed
with the main GAP archive, check the package Web page

    https://gap-packages.github.io/automata/

For the development version, please visit the repository in GitHub (https://github.com/gap-packages/automata/)

You may get `automata' as a compressed tar archive (file name ends with
.tar.gz). Use the appropriate command on your system to unpack the
archive.

On UNIX systems the compressed tar archive may be unpacked by

    tar xzf automata-<version>.tar.gz

or, if tar on your system does not understand the option z, by

    gunzip automata-<version>.tar.gz
    tar xf automata-<version>.tar

which will in each case unpack the code into a directory 'automata'
in the current directory. We assume that the current directory is the
directory /usr/local/lib/gap-4.x.x/pkg/.

Installation
------------

You may have to start GAP with the -l option, for instance,

gap -l "/usr/local/lib/gap-4.x.x"

Then try the following

gap> LoadPackage( "automata" ); 
true
gap>

Good luck!

If you use a LINUX system, you may have to, in order to save typing, write
aliases: 

in the file `.bashrc' (or something equivalent, maybe with another syntax): 

alias gap='gap -l "/usr/local/lib/gap-4.x.x;"'

and in the file `.gap/gaprc'

LoadPackage( "automata" ); 


In order to have automatic visualisations and not just to produce the dot code to be visualised by any other means, GraphViz (http://www.graphviz.org/) should be installed.

----------
In other systems, there are equivalent ways to do the same.

Automata is free software you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2 of the License, or (at your
option) any later version. For details, see the file 'GPL' in the
'etc' directory of the GAP distribution or see the FSF's own site.



