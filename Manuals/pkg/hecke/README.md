[![Build Status](https://travis-ci.org/gap-packages/hecke.svg?branch=master)](https://travis-ci.org/gap-packages/hecke)
[![Code Coverage](https://codecov.io/github/gap-packages/hecke/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/hecke)

# Hecke

Hecke is a port of the GAP 3 package Specht 2.4 to GAP 4. Specht 2.4 was written
by Andrew Mathas, who allowed Dmitriy Traytel to use his source code as the basis
for Hecke.


## INSTALLATION

To install the package simply extract the archive into the pkg-folder of your
GAP-installation. Then you should be able to load the package in GAP via

    LoadPackage("hecke");


## FEATURES

This package contains functions for computing the decomposition matrices for
Iwahori-Hecke algebras of the symmetric groups. As the (modular) representation
theory of these algebras closely resembles that of the (modular) representation
theory of the symmetric groups (indeed, the latter is a special case of the
former) many of the combinatorial tools from the representation theory of the
symmetric group are included in the package.

These programs grew out of the attempts by Gordon James and Andrew Mathas to
understand the decomposition matrices of Hecke algebras of type A when q=-1.
The package is now much more general and its highlights include:

1.  Hecke provides a means of working in the Grothendieck ring of a Hecke algebra
    H using the three natural bases corresponding to the Specht modules,
    projective indecomposable modules, and simple modules.

2.  For Hecke algebras defined over fields of characteristic zero, the algorithm
    of Lascoux, Leclerc, and Thibon [LLT96] for computing decomposition numbers
    and "crystallized decomposition matrices" has been implemented. In
    principle, this gives all of the decomposition matrices of Hecke algebras
    defined over fields of characteristic zero.

3.  Hecke provides a way of inducing and restricting modules. In addition, it is
    possible to "induce" decomposition matrices; this function is quite
    effective in calculating the decomposition matrices of Hecke algebras for
    small n.

4.  The q-analogue of Schaper's theorem is included, as is Kleshchev's algorithm
    of calculating the Mullineux map. Both are used extensively when inducing
    decomposition matrices.

5.  Hecke can be used to compute the decomposition numbers of q-Schur algebras
    (and the general linear groups), although there is less direct support for
    these algebras. The decomposition matrices for the q-Schur algebras defined
    over fields of characteristic zero for n<11 and all e are included in Hecke.

6.  The Littlewood-Richard rule, its inverse, and functions for many of the
    standard operations on partitions (such as calculating cores, quotients, and
    adding and removing hooks), are included.

7.  The decomposition matrices for the symmetric groups S_n are included for
    n<15 and for all primes.


## SUPPORT, BUG REPORTS

For bug reports, feature requests and suggestions, please refer to

   <https://github.com/gap-packages/hecke/issues>
