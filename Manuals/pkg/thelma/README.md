
The GAP 4 package `thelma'
==================================

Introduction
------------

This is release 1.02 of  the package `thelma'.

The features of this package include

         - checking the single threshold element realizability of a given boolean function;
         - finding the threshold element representation of a boolean function;
         - finding the boolean function from the given network of threshold elements;
	 - realization of neural elements over finite fields;
         
There is a manual in the sub-directory 'doc' written using the GAP package
gapdoc which describes the available functions in detail. The pdf and html
versions of the manual are also available there.


If you have used this package, please let us know by sending
us an email.  If you  have found important features missing or if there is a
bug, we would appreciate it very much if you send us an email 

Victor Bovdi   <vbovdi@gmail.com>
Vasyl Laver     <vasyl.laver@uzhnu.edu.ua>

or use the issue tracker: https://github.com/gap-packages/Thelma/issues

Contents
--------
With this version you should have obtained the following files and
directories:

        README          this file

        doc             the manual
    
        lib             the GAP code

        init.g          the file that initializes this package

        read.g          the file that reads in the package     

	PackageInfo.g	information file for automatic processing

	version		the version number 1.02

Installation
------------

As this package does not contain any C code, to install it just unpack the archive in the "pkg" directory of your
GAP installation folder. Then enter command "LoadPackage( "thelma" );".

Good luck!
