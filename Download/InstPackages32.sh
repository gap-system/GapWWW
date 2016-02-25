#!/bin/sh -x 

# You need 'gzip', GNU 'tar', a C compiler, sed, pdftex to run this.
# Copy this script to the 'pkg' subdirectory of your GAP installation,
# make it executable with 'chmod u+x InstPackages32.sh' and then start 
# it (or do it step by step with cut and paste) in the 'pkg' subdirectory.

# Contact support@gap-system.org for questions and complaints.

# Note, that this isn't and is not intended to be a sophisticated script.
# Even if it doesn't work completely automatically for you, you may get 
# an idea what to do for a complete installation of GAP.

cd ace
./configure ../..
make
cd ..

cd anupq*
./configure CFLAGS=-m32 LDFLAGS=-m32
make CFLAGS=-m32 LOPTS=-m32
cd ..

# You may not want a writable directory here! In this case substitute
# the directories 'datagens' and 'dataword' by links to somewhere else.
cd atlasrep
chmod 1777 datagens dataword
cd ..

cd Browse
./configure
make
cd ..

# TODO: FIX Carat
# Installation of Carat produces a lot of data, maybe you want to leave 
# this out until a user complains.
# It is not possible to move around compiled binaries because these have the
# path to some data files burned in.
cd carat
tar xzpf carat-2.1b1.tgz
rm -f bin
ln -s carat-2.1b1/bin bin
cd carat-2.1b1/functions
# Install the include Gmp first.
# (If you have already Gmp on your system, you can delete the file
# gmp-*.tar.gz and delete the target 'Gmp' from the target 'ALL' in
# carat-2.1b1/Makefile.)
tar xzpf gmp-*.tar.gz
cd ..
make TOPDIR=`pwd` Links
# Note that Gmp may use processor specific code, so this step may not be ok
# for a network installation if you want to use the package on older computers
# as well.
make TOPDIR=`pwd` Gmp
# And now the actual Carat programs.
make TOPDIR=`pwd` CFLAGS=`-O2`
cd ../..

cd cohomolo-*
./configure 
make 
cd ..

cd cvec-*
./configure CFLAGS="-m32"
make
cd ..

cd digraphs-*
./configure CFLAGS=-m32 CXXFLAGS=-m32 LDFLAGS=-m32
make
cd ..

cd edim
./configure
make
cd ..

cd example
./configure ../..
make
cd ..

cd float-*
./configure CFLAGS="-m32"
make
cd ..

cd fplsa
./configure ../..
make CC="gcc -O2 "
cd ..

cd Gauss
./configure
make 
cd ..

cd grape
./configure ../..
make 
cd ..

cd guava*
./configure ../..
make
make install
cd ..

cd io-*
./configure CFLAGS="-m32"
make
cd ..

cd json-*
./configure CFLAGS="-m32" CXXFLAGS="-m32"
make
cd ..

cd kbmag-*
./configure
make
cd ..

#  Easy, if prerequisites are installed. You may get GNU GMP
#  (http://gmplib.org/) and BLAS (http://www.netlib.org/blas/) 
#  via packages in your Linux distribution. But you probably need to
#  install LinBox (http://www.linalg.org/download.html) yourself.
cd linboxing
./configure 
make
cd ..

cd NormalizInterface-*
CXXFLAGS="-m32" ./build-normaliz.sh
./configure CXXFLAGS="-m32"
make
cd ..

# nq needs GMP. It may be able to find GMP supplied with GAP 
# automatically. Otherwise, adjust the argument to 'make' accordingly.
cd nq-*
./configure
# change paths to your GMP installation
#make GNU_MP_LIB=../../Gmplib/lib GNU_MP_INC=../../Gmplib/include
make
cd ..

cd orb-*
./configure CFLAGS="-m32"
make
cd ..

cd profiling-*
./configure CFLAGS="-m32" CXXFLAGS="-m32"
make
cd ..

#  see the pargap documentation how to use this 
#  (in particular, user needs procgroup file)
#  [more complicated to include EDIM kernel module ...]
cd pargap
./configure ../..
make 
cp bin/pargap.sh ../../bin/
cd ..
rm -f ALLPKG

cd PolymakeInterface
./configure ../..
make
cd ..

# For XGap the following shared libraries of the X window system must be 
# installed on your machine together with the development files (header 
# files and so on):
# 
#   libXaw.so, libXmu.so, libXt.so, libXext.so, libX11.so, libSM.so, libICE.so
# 
# In addition you need on XFree Version >= 4:
# 
#   libXpm.so
#
# If you  miss one of  these under Linux you  can usually just  install some
# more packages of your favorite distribution. The development files usually
# come in some package with "dev" in its name.
cd xgap
./configure
make
rm -f ../../bin/xgap.sh
cp bin/xgap.sh ../../bin/
cd ..
