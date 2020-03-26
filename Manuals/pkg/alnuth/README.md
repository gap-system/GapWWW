[![Build Status](https://travis-ci.org/gap-packages/alnuth.svg?branch=master)](https://travis-ci.org/gap-packages/alnuth)
[![Code Coverage](https://codecov.io/github/gap-packages/alnuth/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/alnuth)

The GAP package Alnuth (Version 3)
==================================

    Copyright (C) 2011      Bjoern Assmann, Andreas Distler, Bettina Eick
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 2 of the license, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program. If not, see <http://www.gnu.org/licenses/>.


Alnuth is an extension, a so called package, for the computer algebra system
GAP and forms part of a standard installation. For information about GAP see
<http://www.gap-system.org/>.

The functionality of Alnuth lies in ALgebraic NUmber THeory. It provides an
interface from GAP to certain number theoretic functions from the computer
algebra system PARI/GP. Most computations with Alnuth rely on this interface.
The interface is an integral part of the package, but the software PARI/GP
has to be obtained independently.


New in Version 3
================

Up to and including Version 2.3.1, Alnuth was restricted to operating systems
based on Unix. This is no longer the case and Alnuth can now also be used
under Windows. Moreover, former versions of Alnuth provided an interface to
KANT, respectively its shell KASH, instead of one to PARI/GP. This change did
not influence the availability of GAP functions in the package. Note that any
further changes and bugfixes will only be made to Version 3 of Alnuth which
contains the interface to PARI/GP.


Installing Alnuth
=================

The package Alnuth is part of the standard distribution of GAP so that in most
cases there is no need to install it separately. To use Alnuth you need to
have PARI/GP installed. See the following section for information on PARI/GP.

In case you want to update Alnuth independently of your main GAP installation,
you can download it from its homepage https://gap-packages.github.io/alnuth/.
If you are interested in an old version of Alnuth interfacing to KANT/KASH
you can find all released versions of Alnuth starting from v1.0 (09/10/2003)
at https://github.com/gap-packages/alnuth/releases.

There are two ways of installing a GAP package. If you have permission to add
files to the installation of GAP on your system you may install Alnuth into
the `pkg' subdirectory of the GAP installation tree. Otherwise you may install
Alnuth in a private `pkg' directory (for details see `76.1 Installing a GAP
Package' and `9.2 GAP Root Directories' in the reference manual).

To install the latest version of Alnuth under Linux download one of the
archives `alnuth.tar' and `alnuth.tar.gz', move it to the directory `pkg' in
which you want to install, and unpack the archive. If you are using the
command line you can unpack the former with the command `tar xf alnuth.tar',
respectively `tar xzf alnuth.tar.gz' for the gzipped tar-archive.

For installation under Windows download the archive `alnuth-win.zip', move it
to the `pkg' directory in which you want to install, and extract the archive.


Getting PARI/GP
===============

Using Alnuth requires an installation of PARI/GP in Version 2.5 or higher. The
software PARI/GP is freely available at <http://pari.math.u-bordeaux.fr/>.

Note that the place where PARI/GP is located in your system is independent of
the place where Alnuth is installed.

In many Linux distributions PARI/GP can be installed via the software package
manager, but this might sometimes be an older version which cannot be used
together with Alnuth.

If you install PARI/GP from source make sure you install with GMP support for
better performance and complete the installation with `make install' so that
you can start GP by just calling `gp' from the command line.

For Windows it is sufficient to get the basic GP binary which can be found at
<http://pari.math.u-bordeaux.fr/download.html>.


Adjust the path of the executable for GP
========================================

This package needs to know where the executable for GP is. In the default
setting Alnuth looks for an executable program named `gp' in the search paths
of the system. More precisely, for a file `gp' inside one of the directories
in the list returned by `DirectoriesSystemPrograms()'.

Under Linux the default setting should work with a standard installation of
PARI/GP.

For the default setting to work under Windows the downloaded executable file,
for example `gp-2-5-0.exe' has to be renamed to `gp.exe' and moved to one of
the directories listed by `DirectoriesSystemPrograms()'.

If you cannot use the default setting for you purpose, you can find more
information in the last chapter of the Alnuth manual.


Loading the package
===================

If Alnuth is not loaded when GAP is started you have to request it explicitly
to use it. This is done by calling `LoadPackage("Alnuth");' in a GAP session.
If Alnuth had not been loaded already a short banner will be displayed.

    gap> LoadPackage("Alnuth");
    Loading  Alnuth 3.1.0 (Algebraic number theory and an interface to PARI/GP)
    by Bjoern Assmann (http://www.dcs.st-and.ac.uk/~bjoern),
       Andreas Distler (a.distler@tu-bs.de), and
       Bettina Eick (http://www.icm.tu-bs.de/~beick).
    Homepage: https://gap-packages.github.io/alnuth
    true
    gap>

To load a certain version of Alnuth you can specify the version number as
second argument in the call to `LoadPackage'. (See `76.2 Loading a GAP
package' in the reference manual or type `?LoadPackage' within a GAP session).


Testing the package
===================

Once the package is loaded, it is possible to check the correct installation
running a short test by calling `ReadPackage("Alnuth", "tst/testinstall.g");'.

    gap> ReadPackage("Alnuth", "tst/testinstall.g");
    Architecture: x86_64-apple-darwin15.6.0-gcc-6-default64
    
    test file         GAP4stones     time(msec)
    -------------------------------------------
    testing: /Users/user/gap4r8p8/pkg/alnuth/tst/version.tst
    /Users/user/gap4r8p8/pkg/alnuth/tst/version.tst       0             52
    testing: /Users/user/gap4r8p8/pkg/alnuth/tst/ALNUTH.tst
    /Users/user/gap4r8p8/pkg/alnuth/tst/ALNUTH.tst     751            133
    -------------------------------------------
    total                    751            133
    
    #I  No errors detected while testing

If the test suite runs into an error in the first part, which verifies the
availability of PARI/GP, check your installation of PARI/GP and consult the
last chapter of the documentation of Alnuth for more information.


Contact
=======

If you find any bugs or have any suggestions or comments, we would very much
appreciate it if you would let us know by submitting an issue at the Alnuth
issue tracker on GitHub <https://github.com/gap-packages/alnuth/issues> or by
writing to `beick(at)tu-bs.de'.

Andreas Distler (a.distler(at)tu-bs.de)

Bettina Eick (beick(at)tu-bs.de)
    AG Algebra und Diskrete Mathematik
    Institut Computational Mathematics
    TU Braunschweig
    Pockelsstr. 14
    D-38106 Braunschweig
    Germany
