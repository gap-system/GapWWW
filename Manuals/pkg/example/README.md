[![Build Status](https://travis-ci.org/gap-packages/example.svg?branch=master)](https://travis-ci.org/gap-packages/example)
[![Code Coverage](https://codecov.io/github/gap-packages/example/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/example)

# The Example package

* Website: gap-packages.github.io/example/
* Repository: https://github.com/gap-packages/example

This package serves as an example of how to create a GAP 4 package.

The Example package uses an external binary and therefore a complete
installation only works on UNIX systems or systems that support a
UNIX-like environment, e.g. OS X, or Windows with Cygwin. However, 
a partial installation without the external binary is possible on 
any system.

To compile the package, change to the `/pkg/example-*` directory 
of your GAP installation and then call
	
	./configure <path>

where <path> is a path to the main GAP root directory; so normally you
would call

	./configure ../..

(the `../..` is the default and so may be omitted) and then call

	make 
  
to compile the binary.

Now start GAP and type

	LoadPackage("example");

to load the package. You will see the package banner. If you have
not compiled the external binary, you should receive a warning.

For details on how to use the Example package see the package
documentation in the `doc` subdirectory (view its HTML version or 
`manual.pdf`  via a PDF viewer). You will find additional information 
on how to create a GAP package in the Appendix of the manual.

Maintainers:
* Werner Nickel (before 2002)
* Greg Gamble (2002-2006)
* Alexander Konovalov (since 2011)
