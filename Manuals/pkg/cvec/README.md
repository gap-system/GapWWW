[![Build Status](https://travis-ci.org/gap-packages/cvec.svg?branch=master)](https://travis-ci.org/gap-packages/cvec)
[![Code Coverage](https://codecov.io/github/gap-packages/cvec/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/cvec)

# README file for the 'CVEC' GAP4 package 
     
To get the newest version of this GAP 4 package download the
archive file

    cvec-x.x.tar.gz

and unpack it using 

    tar xvf cvec-x.x.tar.gz

Do this in a directory called `pkg`, preferably (but not necessarily)
in the `pkg` subdirectory of your GAP 4 installation. It creates a
subdirectory called `cvec-x.x`.

To install this package do

    cd cvec-x.x
    ./configure

If you installed cvec in another directory than the usual `pkg`
subdirectory, do

    ./configure --with-gaproot=path

where 'path' is a path to the main GAP root directory.
See

    ./configure --help

for further options.

Afterwards call `make` to compile a binary file.

The package will not work without this step.

If you installed the package in another `pkg` directory than the standard
`pkg` directory in your GAP 4 installation, then you have to add the path
to the directory containing your `pkg` directory to GAP's list of directories.
This can be done by starting GAP with the `-l` command line option
followed by the name of the directory and a semicolon. Then your directory
is prepended to the list of directories searched. Otherwise the package 
is not found by GAP. Of course, you can add this option to your GAP
startup script.

----------------------------------------------------------------------------

Recompiling the documentation is possible by the command `gap makedoc.g`
in the `cvec` directory. But this should not be necessary.

For bug reports, feature requests and suggestions, please refer to

   <https://github.com/gap-packages/cvec/issues>
