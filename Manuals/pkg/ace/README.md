[![Travis build Status](https://travis-ci.org/gap-packages/ace.svg)](https://travis-ci.org/gap-packages/ace/builds)
[![AppVeyor build Status](https://ci.appveyor.com/api/projects/status/github/gap-packages/ace?branch=master&svg=true)](https://ci.appveyor.com/project/gap-packages/ace)
[![Code Coverage](https://codecov.io/github/gap-packages/ace/coverage.svg)](https://codecov.io/gh/gap-packages/ace)


# The ACE package

The  ACE  package  provides  functions associated  with  Todd-Coxeter  coset
enumeration by interfacing with the Advanced Coset Enumerator (ACE),

ACE coset enumerator (C) 1995-2001 by George Havas and Colin Ramsay
<http://staff.itee.uq.edu.au/havas>

from within GAP 4.

The GAP  interface (package) has been  written by Alexander Hulpke  and Greg
Gamble. In order  to install the ACE  package you must get  the archive file
e.g. `ace-XXX.tar.gz`, for some version  number `XXX`, (which includes the C
source code of Havas and Ramsay).

The ACE  package provides  a mechanism to  replace GAP's  usual Todd-Coxeter
coset enumerator by ACE, so that  functions that behind the scenes use coset
enumeration will use the ACE enumerator. The ACE enumerator may also be used
explicitly; both non-interactively and interactively. However the package is
used,  a plethora  of options  and strategies  are available  to assist  the
user in  avoiding incomplete  coset enumerations.

You can download  `ace-XXX.tar.gz`  (where  `XXX`  is  the  package  version
number) from the home page for the ACE package

https://gap-packages.github.io/ace/

or via the GAP web site

https://www.gap-system.org/Packages/ace.html

If you prefer .zip or tar.bz2 to tar.gz archives, substitute the appropriate
suffix in the  above paths.

Since the ACE package interfaces to an external binary, it is only usable in
an  environment that  supports compiling  of the  binary, e.g.  a UNIX  or a
UNIX-like environment.

## Installing the ACE package

To install  the ACE package, move  the file `ace-XXX.tar.gz` into  the `pkg`
directory  in which  you plan  to  install ACE.  Usually, this  will be  the
directory `pkg` in the  hierarchy of your version of GAP  4. (However, it is
also  possible  to  keep  an  additional `pkg`  directory  in  your  private
directories,  see  section  "ref:Installing  GAP  Packages"  of  the  GAP  4
reference manual for details on how to do this.)

Then unpack `ace-XXX.tar.gz`,  which in most Linux environments  can be done
by

    tar zxf ace-XXX.tar.gz

Go to  the newly created `ace`  directory and call `configure  <path>` where
<path> is the path to the GAP  home directory. So for example if you install
the package in the main `pkg` directory call

    ./configure ../..

In fact `../..`  is the default path.  So, if this is correct,  you may omit
it. This  will fetch the architecture  type for which GAP  has been compiled
last and create a `Makefile`. Now simply call

    make

to compile the binary and to install it in the appropriate place.

Note that the current version of the configuration process only  sets  up
directory paths. If you need a different compiler or  different  compiler
options, you need to  edit  `src/Makefile`  prior  to  calling  `make`
yourself.

If you use this installation of GAP on different hardware  platforms  you
will have to compile the binary for each  platform  separately.  This  is
done by calling `configure` and `make` for the package  anew  immediately
after compiling GAP itself  for  the  respective  architecture.  If  your
version of GAP is already compiled (and has last  been  compiled  on  the
same architecture) you do not need to compile GAP again, it is sufficient
to call the `configure` script in the GAP home directory.

That's it. Now start GAP and type

    LoadPackage("ace");

The ACE banner should appear on the screen.

For details on how to use the ACE package see the  package  documentation
in the  `doc`  subdirectory  (view  either  `manual.dvi`  via  `xdvi`  or
`manual.ps` via `ghostview` or `manual.pdf`  via  a  PDF  viewer),  which
gives information on how to use ACE from within GAP. The ACE user  manual
(`ace3001.ps`  or  `ace3001.pdf`)  in  the  `standalone-doc`   directory,
explains how to use the ACE binary (i.e. the C program that is interfaced
with by the package from within GAP) as a stand-alone.

The `src` subdirectory contains a copy of the C source code for ACE.  The
only modification are those listed in  src/CHANGES.  In  particular,  the
the following bug was fixed on 25 February, 2001.

A bug was  discovered  in  ACE  3.000  on  22  December,  2000  that  was
particularly manifested by the Linux gcc compilers listed below. The  bug
was  reported  with  fix  by  Volker  Gebhardt  (thanks!)  and  caused  a
segmentation fault when ACE output  coset  representatives.  The  fix  is
incorporated in ACE 3.001 which we now use.

ACE has been compiled successfully with the following C compiler:

   gcc version 4.8.4 (Ubuntu 4.8.4-2ubuntu1~14.04.1)

and is presumed to compile with any modern version of C compiler.

If you encounter problems with the ACE binary, please contact one of  the
C code authors:  George  Havas  <havas@itee.uq.edu.au>  or  Colin  Ramsay
<cram@itee.uq.edu.au>.

If you encounter problems at the GAP level, please submit an issue to
<https://github.com/gap-packages/ace/issues>

When sending a bug report, remember we will need to be able to  reproduce
the problem; so please include:

 * The version of GAP you are using; either look at  the  header  when
   you start up GAP, or at the gap> prompt type: VERSION;
 * The operating system you are using e.g. Linux, macOS, Windows, ...
 * The compiler you used to compile ACE  and  the  options  you  used.
   Type: gcc -v or: cc -version, and  look  in  src/Makefile  for  the
   value of CC to find out.
 * A script, either in GAP or standalone ACE,  that  demonstrates  the
   bug, along with a description of why it's a  bug  (e.g.  by  adding
   comments  to  the  script  -  recall,  comments,  both  in  GAP  or
   standalone ACE, begin with a #).
