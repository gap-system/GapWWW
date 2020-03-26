[![Build Status](https://travis-ci.org/gap-packages/wedderga.svg?branch=master)](https://travis-ci.org/gap-packages/wedderga)
[![Code Coverage](https://codecov.io/github/gap-packages/wedderga/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/wedderga)

# GAP package Wedderga

The title "Wedderga" stands for "Wedderburn decomposition of group algebras". 
This is a  GAP package  to compute  the simple components  of the  Wedderburn 
decomposition  of  semisimple  group algebras.  So the main functions  of the 
package returns  a list of simple algebras  whose direct sum is isomorphic to 
the group algebra given as input.

The methods implemented by the package  produces the Wedderburn decomposition 
of a group algebra FG provided  G is a finite group and  F is either a finite 
field  of  characteristic coprime with  the order of G,  or an abelian number 
field (i.e. a subfield of a finite cyclotomic extension of the rationals).

Other functions  of  Wedderga  compute  the primitive  central idempotents of 
semisimple  group  algebras  and  a  complete  set  of  orthogonal  primitive 
idempotents, and calculate Schur indices of simple algebras.

The package also  provides  functions  to  construct  crossed products over a 
group  with  coefficients  in  an  associative  ring  with  identity  and the 
multiplication determined by a given action and twisting.

Furthermore, the package  provides functions to create code words from a group 
ring element.

Wedderga  does  not  use  external  binaries and,  therefore,  works  without 
restrictions on  the type  of the operating system.  It is redistributed with
GAP, but is not loaded by default. Therefore, to use Wedderga, first you need
to load it using the following command:

    gap> LoadPackage("wedderga");


Gurmeet Kaur Bakshi, Osnel Broche Cristo, Allen Herman, Alexander Konovalov, 
Sugandha Maheshwary, Aurora Olivieri, Gabriela Olteanu, Ángel del Río and 
Inneke Van Gelder.
