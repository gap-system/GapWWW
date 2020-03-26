[![Build Status](https://travis-ci.org/gap-packages/orb.svg?branch=master)](https://travis-ci.org/gap-packages/orb)
[![Code Coverage](https://codecov.io/github/gap-packages/orb/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/orb)

# orb -- GAP package providing methods to enumerate orbits

## Installation

To get the newest version of this GAP 4 package download from
<https://gap-packages.github.io/orb/> the archive file
    orb-x.x.tar.gz
and unpack it using 
    tar xvzf orb-x.x.tar.gz

Do this in a directory called `pkg`, preferably (but not necessarily)
in the `pkg` subdirectory of your GAP 4 installation. It creates a
subdirectory called `orb`.

To install this package do

    cd orb
    ./configure

If you installed orb in another directory than the usual `pkg`
subdirectory, do
    ./configure --with-gaproot=path
where `path` is a path to the main GAP root directory.
See
    ./configure --help
for further options.

Afterwards call `make` to compile a binary file.

The package  will not work without  this  step.

If you installed the package in another 'pkg' directory than the standard
'pkg' directory in your GAP 4 installation, then you have to add the path
to the directory containing your 'pkg' directory to GAP's list of directories.
This can be done by starting GAP with the '-l' command line option
followed by the name of the directory and a semicolon. Then your directory
is prepended to the list of directories searched. Otherwise the package 
is not found by GAP. Of course, you can add this option to your GAP
startup script.

## Documentation

You can read the documentation online at
  <https://gap-packages.github.io/orb/doc/chap0.html>

You can also access it from within GAP by entering `?orb` on the GAP
prompt.

## Bug reports

Please submit bug reports, feature requests and suggestions via our
issue tracker at <https://github.com/gap-packages/orb/issues>.
