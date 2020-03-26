# The Unipot package

The `Unipot` package provides GAP with the ability to compute with
elements of unipotent subgroups of Chevalley groups, but also some
properties of this groups.


## Installing UNIPOT

This document describes the procedure of installing the package.

Installing `Unipot` should be easy once you have installed GAP itself.
We assume here that you want to install `Unipot` in its standard
location, which is in the `pkg` subdirectory of the main GAP4
installation.

You have to perform the following steps to install `Unipot`:

- Get the sources.
- Unpack the sources into the `pkg` directory.

You can download the sources from
 <https://gap-packages.github.io/unipot/>
or alternatively from the same places as GAP:
 <https://www.gap-system.org/Packages/unipot.html>

If you installed a recent version of the packages-... file of the GAP
distribution, then `Unipot` is most likely already installed. If not,
you can download the package `Unipot` separately. In that case go to the
subdirectory `pkg` of the main GAP directory (when you installed the GAP
distribution, a new directory called `gap4r<X>` for some <X> was
created; this directory contains the `pkg` subdirectory). The standard
location would be

    /usr/local/lib/gap4rX/pkg

Then extract the sources of the `Unipot` package. `Unipot` resides
completely in the following subdirectory (assuming standard location):

    /usr/local/lib/gap4rX/pkg/unipot

### Installing in a different than the standard location

It could happen that you do not want to install `Unipot` in its
standard location, perhaps because you do not want to bother
your system administrator and have no access to the GAP
directory. In this case just unpack `Unipot` in any other
location within a `pkg` directory as described above. E.g. the
directory containing the `pkg` directory is `/home/user/mygap`,
then `Unipot` resides in `/home/user/mygap/pkg/unipot`.

Note that you *either* have to edit the startup script `gap.sh`:
 Add `/home/user/mygap` separating it with a semicolon (`;`)
 from previous directories for the variable `GAP_DIR`
*or* you have to start GAP with following command line option:

    gap -l "/usr/local/lib/gap4rX;/home/user/mygap"


## Loading `Unipot` in GAP

The documentation of the package is available in any GAP4 session, even
if the package is not loaded. Like any other package, `Unipot` is loaded
in GAP with

    gap> LoadPackage("unipot");

within the GAP4 session.


## Contact and support

If you have problems with this package, wish to make comments or
suggestions, or if you find bugs, please report them via

   <https://github.com/gap-packages/unipot/issues>

Also, we would like to hear about applications of this package.
(See "Citing Unipot", section 3 of the manual preface.)


## Copyright and license

Copyright (C) 2000-2004, Sergei Haller

This code is released under the GPL version 2 or later (at your
preference). For the full license text, consult the `LICENSE` file or
visit <https://www.gnu.org/licenses/>.
