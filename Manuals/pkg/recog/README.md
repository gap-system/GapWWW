[![Build Status](https://travis-ci.org/gap-packages/recog.svg?branch=master)](https://travis-ci.org/gap-packages/recog)
[![Code Coverage](https://codecov.io/github/gap-packages/recog/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/recog)

# recog

A GAP package for group recognition

## Installation

To get the newest version of this GAP 4 package download the
archive file
    recog-x.x.tar.gz
and unpack it using
    tar xvf recog-x.x.tar.gz

Do this in a directory called `pkg`, preferably (but not necessarily)
in the `pkg` subdirectory of your GAP 4 installation. It creates a
subdirectory called `recog`.

This is all which is needed if you installed the package in the standard
`pkg` subdirectory.

Note that the recog package needs the `orb`, `genss`, `FactInt`,
`AtlasRep` and `Forms` packages to work.

If you installed the package in another `pkg` directory than the standard
`pkg` directory in your GAP 4 installation, then you have to add the path
to the directory containing your `pkg` directory to GAP's list of directories.
This can be done by starting GAP with the `-l` command line option
followed by the name of the directory and a semicolon. Then your directory
is prepended to the list of directories searched. Otherwise the package
is not found by GAP. Of course, you can add this option to your GAP
startup script.

Recompiling the documentation is possible by the command `gap makedoc.g`
in the recog directory. But this should not be necessary.

## Support

For bug reports, feature requests and suggestions, please refer to

   https://github.com/gap-packages/recog/issues
