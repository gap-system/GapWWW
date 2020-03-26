[![Build Status](https://travis-ci.com/homalg-project/NConvex.svg?branch=master)](https://travis-ci.com/homalg-project/NConvex)
[![Code Coverage](https://codecov.io/github/homalg-project/NConvex/coverage.svg?branch=master&token=)](https://codecov.io/gh/homalg-project/NConvex)

The NConvex package
=========================
version 2019.12.10

Introduction
------------
The [NConvex](https://homalg-project.github.io/NConvex) package is a GAP package. Its aim is to carry out polyhedral constructions and computations, namely computing properties and attributes of
cones, polyhedrons, polytopes and fans. Its has been written
to provide the needed tools for the package "ToricVarieties". All written as
part of the homalg-project. A list of available operations can be found in the 
[manual.pdf](https://github.com/homalg-project/NConvex/releases/latest/download/manual.pdf)


Installation
-----------
The package can easily be obtained by cloning the repository 
  
  https://github.com/homalg-project/NConvex.git

in the pkg directory of the Gap installation or your local directory for Gap packages.

Required packages
-----------------

-   The Gap package "CddInterface" is required to convert between H-rep and V-rep of polyhedrons. It can be obtained at:
  
      https://github.com/homalg-project/CddInterface.git
  
-   The Gap/homalg-project package "Modules". You can install the package by cloning the "homalg_project" repository from
    
      https://github.com/homalg-project/homalg_project.git

-   You will also need "AutoDoc" package to be able to create the documentation and to perform tests. 
    A fresh version can be installed from
    
      https://github.com/gap-packages/AutoDoc.git

-   The Gap package "NormalizInterface". You can install it from
    
      https://github.com/gap-packages/NormalizInterface.git

-   In case "NormalizInterface" is not available, then you can use the Gap/homalg package
    "4ti2Interface". It is already included in the homalg-project 
  
      https://github.com/homalg-project/homalg_project
  
    Make sure to change accordingly the dependencies entry in PackageInfo.g.

Remarks
-------
-   To create the documentation go in your terminal to where you installed the package and 
 perform the command
   ```sh
   .../NConvex$ gap makedoc.g
   ```
-   To run tests:
   ```sh
   .../NConvex$ gap tst/testall.g
   ```
-   For the installation of Gap see https://www.gap-system.org/

-   You can create the documentation with diagrams if your latex installation has the required packages. To try it by un-commenting the required code by:
   
   ```sh
   .../NConvex$ sed -i 's/#?//g' makedoc.g
   ../examples$ sed -i 's/#&/#!/g' *.g
   .../NConvex$ gap makedoc.g
   ```

Of course you are welcome to e-mail me if there are any questions, remarks, suggestions ;)
  
  Kamal Saleh e-mail: saleh@mathematik.uni-siegen.de
  
License
-------

NConvex is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

