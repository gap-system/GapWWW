[![Build Status](https://travis-ci.org/gap-packages/toric.svg)](https://travis-ci.org/gap-packages/toric)
[![Code Coverage](https://codecov.io/github/gap-packages/toric/coverage.svg)](https://codecov.io/gh/gap-packages/toric)

The toric package for toric varieties
=====================================

"toric" is a package that implements some computations related to
toric varieties and combinatorial geometry in GAP.
With "toric", affine toric varieties can be created and
related information about them can be calculated.
"toric" is written entirely in the GAP language by D. Joyner.

This package is licensed under the MIT license.


Installing toric
----------------

To install "toric" (as a GAP 4 Package) unpack the archive file in a
directory in the `pkg` hierarchy of your version of GAP4. (This might be
the `pkg` directory of the GAP 4 home directory.) On a *nix system, this
is accomplished by (1) copying toric.tar.gz into the `pkg` subdirectory,
(2) typing (as root, if necessary) `tar zxvf toric.tar.gz`.


Loading toric
-------------

After starting up GAP, the "toric" package needs to be loaded.
Load "toric" by typing at the GAP prompt:

    gap> LoadPackage( "toric" );

If "toric" isn't already in memory, it is loaded and a small banner
is displayed.


Bug reports
-----------

Please submit bug reports via <https://github.com/gap-packages/toric/issues>.
Alternatively, you can also send an email to support@gap-system.org.

In either case, remember we will need to be able to reproduce the
problem; so please include:

* The version of GAP you are using; either look at the header when
  you start up GAP, or at the gap> prompt type: VERSION;
* The operating system you are using e.g. Linux, Mac OS X, Windows, ...
* A script that demonstrates the bug, along with a description of why
  it's a bug (e.g. by adding comments to the script - recall comments
  in GAP begin with a #).
