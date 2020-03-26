[![Build Status](https://travis-ci.org/gap-packages/guarana.svg?branch=master)](https://travis-ci.org/gap-packages/guarana)
[![Code Coverage](https://codecov.io/github/gap-packages/guarana/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/guarana)

# The GAP 4 package `Guarana`

In this package we demonstrate the algorithmic usefulness of the
so-called Mal'cev correspondence for computations with infinite
polycyclic groups; it is a correspondence that associates to every
$\Q$-powered nilpotent group $H$ a unique rational nilpotent Lie algebra
$L_H$ and vice-versa. The Mal'cev correspondence was discovered by
Anatoly Mal'cev in 1951.

 
## Installing this package

The Guarana package is part of the standard distribution of GAP and
so normally there should be no need to install it separately.

If by any chance it is not part of your GAP distribution, then 
this package is available at
        
     https://gap-packages.github.io/guarana/
                                                                           
in form of a gzipped tar-archive. The standard method is to unpack the
package into the `pkg' directory  of your GAP distribution.  This will
create a `guarana' subdirectory. 
For other non-standard options please see  Chapter 74.1 
in the GAP Reference Manual.

Note that the GAP-Packages Polycyclic and Polenta are needed for this
package. Normally they should be contained in your distribution. If not,
they can be obtained at

    https://www.gap-system.org/Packages/packages.html             


## Loading the Guarana package

If the  Package is not already loaded 
then you have to request it explicitly. 
This  can be 
done by `LoadPackage("guarana")`.
The `LoadPackage` command is described in Section 72.2.1
in the GAP Reference Manual.


## Running the test suite

Once the package is installed, it is possible to check the correct
installation by running the test suite of the package.

    gap> Read(Filename(DirectoriesPackageLibrary("guarana","tst"),"testall.g"));

For more details on  Test Files see Section 7.9 of the GAP Reference Manual.

If the test suite runs into an error, then please submit
a report to our issue tracker at
  <https://github.com/gap-packages/guarana/issues>

                                 
## Copyright & License

Copyright (C) 2007  Björn Assmann <bjoern@mcs.st-and.ac.uk>

Distributed under the terms of the GNU General Public License (GPL) v2

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

                http://www.gnu.org/licenses/gpl-2.0.html

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
USA.
