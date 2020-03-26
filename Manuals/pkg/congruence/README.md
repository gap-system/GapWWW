[![Build Status](https://travis-ci.org/gap-packages/congruence.svg?branch=master)](https://travis-ci.org/gap-packages/congruence)
[![Code Coverage](https://codecov.io/github/gap-packages/congruence/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/congruence)

# GAP package Congruence

The GAP package Congruence  provides functions to construct several types of 
canonical  congruence  subgroups  in  SL_2(Z),  and  also intersections of a 
finite number of such subgroups.

Furthermore,  it implements  the algorithm  for generating  Farey symbols for 
congruence  subgroups  and  using  them  to produce  a system  of independent 
generators for these subgroups.

Congruence  does  not  use  external binaries and,  therefore, works  without
restrictions on  the type  of the operating system.  It is redistributed with
GAP, but is not loaded by default.  Therefore,  to use Congruence,  first you
need to load it using the following command:

    gap> LoadPackage("congruence");


Ann Dooms, Eric Jespers, Alexander Konovalov, Helena Verrill
