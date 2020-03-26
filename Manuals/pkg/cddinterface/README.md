[![Build Status](https://travis-ci.com/homalg-project/CddInterface.svg?branch=master)](https://travis-ci.com/homalg-project/CddInterface)
[![Code Coverage](https://codecov.io/github/homalg-project/CddInterface/coverage.svg?branch=master&token=)](https://codecov.io/gh/homalg-project/CddInterface)

The GAP 4 package `CddInterface'
==============================

# Version

Current version: 2020.01.01

# Why CddInterface

Every convex polyhedron P has two representations, one as the intersection of finite halfspaces and the other as Minkowski sum of the convex hull of
finite points and the nonnegative hull of finite directions. These are called H-representation and V-representation, respectively.

[CddInterface](https://homalg-project.github.io/CddInterface/) is a gap interface with the C package [Cddlib
](https://www.inf.ethz.ch/personal/fukudak/cdd_home/) which among other things can translate between H,V- representations of a polyhedron P and solve linear programming problems over P, i.e. a problem of maximizing and minimizing a linear function over P. A list of all available operations can be found in the [manual.pdf](https://homalg-project.github.io/CddInterface/manual.pdf).

# Prerequisites

Make sure you can update "configure" scriptes by installing `autoconf`:
    
    sudo apt-get update
    sudo apt-get install autoconf

You also need the package `libgmp-dev`:

    sudo apt-get install libgmp-dev
    
Moreover, you need the package `libtool`:

    sudo apt-get install libtool

## Simple installation (with the default cdd for you system):
    
    sudo apt-get install libcdd-dev
    ./autogen.sh
    ./configure --with-gaproot=path-to-gaproot
    make

where the `<path-to-gaproot> ` is the path to the folder where you installed and compiled `Gap` and 
which contains the file `sysinfo.gap`.

## Simple installation (includes building the current cdd from source):

For a simplyfied installation, try the following two commands in the main CddInterface directory

    ./install.sh <path-to-gaproot>

If that does not work, try the following:

## Advanced installation (includes building the current cdd from source):

Go inside the CddInterface directory and download some release of [cddlib](https://github.com/cddlib/cddlib/releases) and extract it. For example the release 0.94j:
    
    wget https://github.com/cddlib/cddlib/releases/download/0.94j/cddlib-0.94j.tar.gz
    tar xvf cddlib-0.94j.tar.gz
    ln -sf $(pwd)/cddlib-0.94j $(pwd)/current_cddlib

After that, compile cddlib via
    
    cd current_cddlib
    mkdir build
    ./bootstrap
    ./configure --prefix=$(pwd)/build
    make
    make install

Cdd should now be installed in the `build` directory. After that, go back to the CddInterface main folder
and install CddInterface with the following commands

    ./autogen.sh
    ./configure --with-gaproot=path/to/gaproot --with-cddlib=$(pwd)/current_cddlib/build
    make

After that, you should be able to load CddInterface.

## Documentation
To create the documentation:
    
    gap makedoc.g

To run the test files

    gap tst/testall.g
    
## Update
The package can be updated using the following commands

    git pull
    make

## Using the package via Docker
With docker app you can run an image of the newest version of gap && CddInterface via
the command

    docker run -it kamalsaleh/gap_packages

## Using the package via Binder
If you want to experiment online with the package you can use `notebook.ipynb` vie the binder link below.

[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/homalg-project/CddInterface/master)



Of course you are welcome to e-mail me if there are any questions, remarks, suggestions ;)

Kamal Saleh e-mail: saleh@mathematik.uni-siegen.de

## License
CddInterface is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

