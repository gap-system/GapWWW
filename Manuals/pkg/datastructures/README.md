[![Travis Build Status](https://travis-ci.org/gap-packages/datastructures.svg?branch=master)](https://travis-ci.org/gap-packages/datastructures)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/gap-packages/datastructures?branch=master&svg=true)](https://ci.appveyor.com/project/gap-packages/datastructures)
[![Code Coverage](https://codecov.io/github/gap-packages/datastructures/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/datastructures)

# The datastructures GAP package

The datastructures package aims at providing standard datastructures,
consolidating existing code and improving on it, in particular in view
of HPC-GAP.

The datastructures package consists of two parts: Interface declarations
and implementations.


# WARNING

This is a BETA release of this package. Interfaces and behaviour might
change between beta releases and break your code. If you are relying on
any feature and would like it to be retained, please contact us via
   <https://github.com/gap-packages/datastructures/issues>

or our slack channel #datastructures on https://gap-system.slack.com.

## Interface Declarations

The goal of interface declarations is to define standard interfaces for
datastructures and decouple them from the implementations. This enables
easy exchangability of implementations, for example for more efficient
implementations, or implementations more suited for parallelisation or
sequential use.

The datastructures package declares interfaces for the following datastructures
* queues
* doubly linked lists
* heaps
* priority queues
* hashtables
* dictionaries

## Implementations

### Queues

List queues based on Reimer Behrends' implementation in HPC-GAP



## Documentation

Full information and documentation can be found in the manual, available
as PDF `doc/manual.pdf` or as HTML `doc/chap0_mj.html`, or on the package
homepage at
  <http://gap-packages.github.io/datastructures/>


## Bug reports and feature requests

Please submit bug reports and feature requests via our GitHub issue tracker:
  <https://github.com/gap-packages/datastructures/issues>


License
=======

datastructures is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2 of the License, or (at your
option) any later version.

For details see the files COPYRIGHT.md and LICENSE.
