[![Build Status](https://travis-ci.org/gap-packages/polenta.svg?branch=master)](https://travis-ci.org/gap-packages/polenta)
[![Code Coverage](https://codecov.io/github/gap-packages/polenta/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/polenta)
  
The GAP 4 package `Polenta`
===========================

 
This package provides functions for  computation with matrix groups.
Let $G$ be a subgroup of $GL(d,R)$ where the ring $R$ is either
equal to $\Q,\Z$ or a finite field $\F_q$.
Then:
  - We can test whether $G$ is solvable.
  - We can test whether $G$ is polycyclic.
  - If $G$ is polycyclic, then we can determine a polycyclic
    presentation for $G$.
    
A group $G$ which is given by a polycyclic presentations can be
largely investigated by algorithms implemented in the GAP-package
Polycyclic. For example we can determine if $G$ is torsion-free and
calculate the torsion subgroup. Further we can compute the derived
series and the Hirschlength of the group $G$. Also various methods
for computations with subgroups, factorsgroups and extensions are
available.

As a by-product, the Polenta package provides some functionality to
compute certain module series for modules of solvable groups. For
example, if $G$ is a rational polycyclic matrix group, then we can
compute the radical series of the natural $\Q[G]$-module $\Q^d$.


Installing this package
=======================

The Polenta package is part of the standard distribution of GAP and
so normally there should be no need to install it separately.

If by any chance it is not part of your GAP distribution, then this
package is available at <http://gap-packages.github.io/polenta/>
in form of a gzipped tar-archive.
The standard method is to unpack the package into the `pkg`
directory  of your GAP distribution.  This will create a `polenta`
subdirectory. For other non-standard options please refer to the
GAP Reference Manual.

Note that the GAP-Packages Alnuth and Polycyclic are needed for this
package. Normally they should be contained in your distribution. If
not they can be obtained at
  <https://www.gap-system.org/Packages/packages.html>.


Loading the Polenta package
==========================

If the  Package is not already loaded then you have to request it
explicitly. This  can be done by `LoadPackage("polenta")`. The
`LoadPackage` command is described in the GAP Reference Manual.


Running the test suite
======================

Once the package is installed, it is possible to check the correct
installation by running the test suite of the package.

    gap> ReadPackage( "Polenta", "tst/testall.g" );

For more details on  Test Files see Section 7.9 of the GAP Reference
Manual.

If the test suite runs into an error, even though the packages
Polycyclic and Alnuth and their depdendencies have been correctly
installed, then please send a message to <max.horn@uni-siegen.de>
including the error message.
   
                                 
Author / Maintainer
===================
 
The Polenta package was originally written by Bjoern Assmann,
who remains his principal author.

It is currently being maintained by Max Horn <max.horn@uni-siegen.de>.

To submit bug reports, feature requests and suggestions, please go to
<https://github.com/gap-packages/polenta/issues>.
