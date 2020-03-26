[![Build Status](https://travis-ci.org/gap-packages/kbmag.svg?branch=master)](https://travis-ci.org/gap-packages/kbmag)
[![Code Coverage](https://codecov.io/github/gap-packages/kbmag/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/kbmag)

# The GAP 4 package 'KBMAG'

This package uses external binaries and currently works only under
UNIX/LINUX systems.


## Package description

KBMAG (pronounced `Kay-bee-mag`) stands for `Knuth-Bendix on Monoids, and
Automatic Groups`. It is a stand-alone package written in C, for use under
UNIX, with an interface to GAP. There are interfaces for the use of KBMAG with
finitely presented groups, monoids and semigroups defined within GAP. The
package also contains a collection of routines for manipulating finite state
automata, which can be accessed via the GAP interface.

The overall objective of KBMAG is to construct a normal form for the elements
of a finitely presented group G in terms of the given generators together with
a word reduction algorithm for calculating the normal form representation of
an element in G, given as a word in the generators. If this can be achieved,
then it is also possible to enumerate the words in normal form up to a given
length, and to determine the order of the group, by counting the number of
words in normal form. In most serious applications, this will be infinite,
since finite groups are (with some exceptions) usually handled better by
Todd-Coxeter related methods. In fact a finite state automaton W is calculated
that accepts precisely the language of words in the group generators that are
in normal form, and W is used for the enumeration and counting functions. It
is possible to inspect W directly if required; for example, it is often
possible to use W to determine whether an element in G has finite or infinite
order.

The normal form for an element g in G is defined to be the least word in the
group generators (and their inverses) that represents G, with respect to a
specified ordering on the set of all words in the group generators.

KBMAG offers two possible means of achieving these objectives. The first is to
apply the Knuth-Bendix algorithm to the group presentation, with one of the
available orderings on words, and hope that the algorithm will complete with a
finite confluent presentation. (If the group is finite, then it is guaranteed
to complete eventually but, like the Todd-Coxeter procedure, it may take a
long time, or require more space than is available.) The second is to use the
automatic group program. This also uses the Knuth-Bendix procedure as one
component of the algorithm, but it aims to compute certain finite state
automata rather than to obtain a finite confluent rewriting system, and it
completes successfully on many examples for which such a finite system does
not exist. In the current implementation, its use is restricted to the
shortlex ordering on words. That is, words are ordered first by increasing
length, and then words of equal length are ordered lexicographically, using
the specified ordering of the generators.

The GAP4 version of KBMAG also offers extensive facilities for finding
confluent presentations and finding automatic structures relative to a
specified finitely generated subgroup of the group G. Finally, there is a
collection of functions for manipulating finite state automata that may be of
independent interest.


## Installation

This package uses external binaries and currently works only under
UNIX/LINUX systems.

It will work only on GAP versions >= 4.7.

To complete the installation of the `kbmag` package go to the
directory `kbmag` created (the directory contains a copy of this
README file) and call

    ./configure <PATH>

where `PATH` is a path to the main GAP root directory; so normally you
would call

    ./configure ../..

and then call

    make

to compile the binary.

If you installed GAP on several architectures, you must execute this
configure/make step for the `kbmag` package on each of the architectures
immediately after configuring GAP itself on this architecture.


## Documentation

Full information and documentation can be found in the manual, available
as PDF `doc/manual.pdf` or as HTML `doc/chap0.html`, or on the package
homepage at

  <https://gap-packages.github.io/kbmag/>


## Bug reports and feature requests

Please submit bug reports and feature requests via our GitHub issue tracker:

  <https://github.com/gap-packages/kbmag/issues>


## License

kbmag is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

For details see the file LICENSE.
