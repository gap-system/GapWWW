[![Build Status](https://travis-ci.org/gap-packages/YangBaxter.svg?branch=master)](https://travis-ci.org/gap-packages/YangBaxter)
[![Code Coverage](https://codecov.io/github/gap-packages/YangBaxter/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/YangBaxter)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.2573572.svg)](https://doi.org/10.5281/zenodo.2573572)

# YangBaxter

This is a GAP package to perform calculations related to set-theoretic 
solutions to the Yang-Baxter equation. The package includes
a database of (skew) braces up to size 150 (with some exceptions)
and all cycle sets of size <9. 

YangBaxter does not use external binaries and, therefore, works without restrictions on the type of the operating system. It is redistributed with GAP, but is not loaded by default. To use YangBaxter, first you need to load it using the following command:

gap> LoadPackage("YangBaxter");

Alexander Konovalov, Leandro Vendramin

Thanks go to:
* Emiliano Acri
* Marco Bonatto
