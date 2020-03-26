[![Build Status](https://travis-ci.org/gap-packages/tomlib.svg?branch=master)](https://travis-ci.org/gap-packages/tomlib)
[![Code Coverage](https://codecov.io/github/gap-packages/tomlib/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/tomlib)

The GAP Library of Tables of Marks
==================================

Description
-----------

This is the GAP Library of Tables of Marks,
which is an add-on package for GAP 4.

If you have found important features missing or if there is a bug,
let us know and we will try to address it in the next version of the
GAP Library of Tables of Marks.
Please send a short email to

          Liam Naughton    <l.naughton@wlv.ac.uk>

This holds in particular if you have used the GAP Library of Tables of Marks
to solve a problem.

You can also reach the GAP developers by sending an email to the general
GAP email address for problems with GAP:

                     support@gap-system.org

Unpacking
---------

You may have got the GAP Library of Tables of Marks as or a compressed tar
archive (filename ends with .tar.gz). Use the appropriate command on your
system to unpack the archive.

On UNIX systems the compressed tar archive may be unpacked by

    tar xzf tomlib-x.y.z.tar.gz

or, if tar on your system does not understand the option z, by

    gunzip tomlib-x.y.z.tar.gz
    tar xf tomlib-x.y.z.tar


Installation
------------

Installation of the GAP Library of Tables of Marks means unpacking the
archive file in an appropriate directory.

For the two ways of installing GAP 4 packages in general,
see the sections "Installing a GAP Package" and
"GAP Root Directory" in the GAP 4 Reference Manual.

Once you have successfully installed the GAP Library of Tables of Marks,
it is usually loaded automatically when GAP is started;
if not then it can be loaded explicitly by typing

    gap> LoadPackage( "tomlib" );
    true

at the GAP prompt.
Then the functions of the library are available in the current session.
