[![Build Status](https://travis-ci.org/gap-packages/cohomolo.svg?branch=master)](https://travis-ci.org/gap-packages/cohomolo)
[![Code Coverage](https://codecov.io/github/gap-packages/cohomolo/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/cohomolo)

# The GAP 4 package 'cohomolo'

## Package description

It may be used to perform certain cohomological calculations on a finite
permutation group G. The following properties of G can be computed:

1. The p-part Mul_p of the Schur multiplier Mul of G,
and a presentation of a covering extension of Mul_p by G, for a specified
prime p;

2. The dimensions of the first and second cohomology groups of G
acting on a finite dimensional KG-module M, where K is a field of prime
order; and

3. Presentations of split and nonsplit extensions of M by G.


## Installation

This package uses external binaries and currently works only under
UNIX/LINUX systems.

To install the package go to the GAP directory `pkg/cohomolo` (the
directory containing this README file) and call

    ./configure PATH

where `PATH` is a path to the main GAP root directory; so normally you
would call

    ./configure ../..

and then call

    make

to compile the binary.

If you installed GAP on several architectures, you must execute this
configure/make step for the `cohomolo` package on each of the architectures
immediately after configuring GAP itself on this architecture.


## Documentation

Full information and documentation can be found in the manual, available
as PDF `doc/manual.pdf` or as HTML `htm/chapters.htm`, or on the package
homepage at

  <https://gap-packages.github.io/cohomolo/>


## Bug reports and feature requests

Please submit bug reports and feature requests via our GitHub issue tracker:

  <https://github.com/gap-packages/cohomolo/issues>


## License

cohomolo is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

For details see the file LICENSE.


## Updating from GAP3

This package has been updated from the original GAP3 package
with minimal changes, so the user should find the interface unchanged.
In fact the only real changes are that the function `InfoCohomology` has been
replaced by the `Info` variable `InfoCohomolo`, and the function
`SplitExtension` has been renamed `SplitExtensionCHR, to avoid clashing
with an existing GAP function name. (Of course, it does more or less
the same thing as the GAP function!)
