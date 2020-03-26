# FPLSA -- The Finitely Presented Lie Super-Algebra Package
## A Link to an External Lie Todd-Coxeter Program

When  K  is  a  finitely-presented  Lie  algebra,  the  GAP  operation
`IsomorphismSCTableAlgebra` can be used to make  the  structure  of  K
explicit, in the form of an  isomorphic  algebra  given  by  structure
constants, which is much more amenable to further computations.

This GAP package installs an alternative method  for  this  operation,
which calls an external C program (fplsa version 4.0) to do  the  hard
part of the computation. This speeds up the  calculation  and  permits
larger problems  to  be  attempted.  The  external  program  has  much
additional functionality which is not used by the present  version  of
the package.

Since the package contains an external C program, it works only  under
UNIX and requires a C compiler to install it.

### Installing FPLSA

You have to perform the following steps to install FPLSA:

 - Get and unpack the sources
 - Use the `configure` script to adjust everything to your specific 
   system
 - Compile the C part of FPLSA

#### Getting and unpacking the sources

Typically `fplsa` will already be distributed along with your GAP
distribution, in which case you can skip this step.

Otherwise, you can download the latest version of this package from
its homepage, which is
  <https://gap-packages.github.io/FPLSA/>

You will end up with a file named `fplsa-X.Y.tar.gz`, where `X.Y` is
a version string like `1.1`.

You now change your current directory to the `pkg`subdirectory of the
location where you installed GAP. Now you extract the sources for the
FPLSA package (replace `X.Y` with the actual version):

    tar xf fplsa-X.Y.tar.gz

The `tar` utility  unpacks  the  files  and  stores  them  into  the
appropriate subdirectories. FPLSA resides in the `fplsa-X.Y`
subdirectory.


#### Configuring and Compiling the C part

You have to change your current working directory to the subdirectory
FPLSA lives in. Starting from the `pkg` dirctory of your GAP
installation, you can do this via this command (replace `X.Y` with
the actual version):

    cd fplsa-X.Y

Now you invoke the `configure` script by:

    ./configure ../..

This script produces some Makefiles which  are  used  to  compile  the
code. You do this by typing

    make

If there were no error, then all C sources should have been compiled
and a binary executable been built.  If you now enter GAP, type

    gap> LoadPackage( "fplsa" );

Then the new functionality should be available.


### Documentation

Full information and documentation can be found in the manual, available
as PDF `doc/manual.pdf` or as HTML `doc/chap0_mj.html`, or on the package
homepage at

  <https://gap-packages.github.io/FPLSA/>


### Bug reports and feature requests

Please submit bug reports and feature requests via our GitHub issue tracker:

  <https://github.com/gap-packages/FPLSA/issues>


### License

fplsa is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

For details see the file LICENSE.


### Authors

The FPLSA program was written by V Gerdt and V Kornyak, both of the:

Laboratory of Computing Techniques and Automation,
Joint Institute for Nuclear Research, Dubna, Moscow Region 141980,
Russia. Email: <gerdt@jinr.ru> and <vkornyak@gmail.com>

