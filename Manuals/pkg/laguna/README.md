[![Build Status](https://travis-ci.org/gap-packages/laguna.svg?branch=master)](https://travis-ci.org/gap-packages/laguna)
[![Code Coverage](https://codecov.io/github/gap-packages/laguna/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/laguna)

# GAP package LAGUNA

The  title  "LAGUNA"   stands  for  "Lie  AlGebras  and  UNits  of  group
Algebras". 

LAGUNA  extends  GAP  functionality  for  computations  in  group  rings.
Besides  computing some general  properties and attributes of group rings 
and  their  elements,  LAGUNA  is  able  to  perform  two  main  kinds of
computations.  Namely,  it can verify whether a group algebra of a finite 
group  satisfies  certain  Lie  properties;  and  it  can  calculate  the 
structure  of the  normalized unit group  of a group algebra  of a finite 
p-group over the field of p elements. 

LAGUNA  does not  use  external binaries  and,  therefore,  works without
restrictions  on the type  of the  operating system.  It is redistributed
with and is loaded by default. If it is not loaded due to the specific 
user settings, load it using the following command:

    gap> LoadPackage("laguna");


## History and Acknowledgements

Some of the features of  LAGUNA were already included in the GAP4 package
LAG  written  by the third  author,  Richard Rossmanith.  The three other
authors first would like to thank Greg Gamble for maintaining LAG and for
upgrading it from version 2.0 to version 2.1,  and Richard Rossmanith for 
allowing them to update and extend the LAG package.  We are also grateful 
to Wolfgang Kimmerle for the organisation of the workshop  "Computational 
Group and Group Rings Theory"  (University of Stuttgart,  28-29 November, 
2002)  which allowed us  to meet together  and have  fruitful discussions 
that led towards the final LAGUNA release.

We are all very grateful to the members of the GAP team:  Thomas  Breuer,
Willem  de Graaf,  Alexander  Hulpke,  Stefan Kohl,  Steve Linton,  Frank
Luebeck,  Max Neunhoeffer  and many other colleagues  for hepful comments
and advise. We acknowledge very much  Herbert Pahlings  for communicating 
the  package  and  the  referee  for careful testing  LAGUNA  and  useful 
suggestions.

A part of the work on upgrading LAG  to  LAGUNA was  done  in 2002 during
Alexander  Konovalov's  visits  to  Debrecen,  St.Andrews  and  Stuttgart 
Universities.  He would like to express his gratitude  to  Adalbert Bovdi
and  Victor Bovdi,  Colin  Campbell,  Edmund Robertson and  Steve Linton,
Wolfgang  Kimmerle,  Martin  Hertweck  and  Stefan  Kohl  for  their warm
hospitality, and to the NATO Science Fellowship Programme, to the  London
Mathematical Society and to the DAAD for the support of this visits.

See the file ChangeLog  for the details about changes  introduced in each 
LAGUNA release.


Victor Bovdi, Alexander Konovalov, Richard Rossmanith and Csaba Schneider
