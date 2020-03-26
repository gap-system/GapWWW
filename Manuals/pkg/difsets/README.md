[![travis](https://travis-ci.com/dylanpeifer/difsets.svg?branch=master)](https://travis-ci.com/dylanpeifer/difsets)
[![codecov](https://codecov.io/gh/dylanpeifer/difsets/branch/master/graph/badge.svg)](https://codecov.io/gh/dylanpeifer/difsets)

# The DifSets Package

The DifSets Package is a GAP package implementing an algorithm for enumerating
all difference sets up to equivalence in a group. The algorithm functions by
finding difference sums, which are potential images of difference sets in
quotient groups of the original group, and searching their preimages. In this
way, the search space can be dramatically decreased, and searches of groups of
relatively large order (such as order 64 or order 96) can be completed.

## Requirements

The package requires at least version 4.9 of [GAP][1]. Additional required GAP
packages are [GRAPE][2] 4.7 and [GAPDoc][3] 1.5. The [SmallGrp][4] package is
also recommended. These required packages are included with a standard install
of GAP, and will be loaded automatically by the DifSets package.

## Installation

As of July 2019, the DifSets package is not currently distributed with a
standard installation of GAP, but will be included in future releases. To
install, first download the [archive][5] and then unpack it in the `pkg`
directory of one of your GAP root directories. After installation, the package
can be loaded at the GAP command prompt by typing

    gap> LoadPackage("DifSets");

after which the DifSets banner should appear on the screen.

## Tests

After installation, basic tests of the package can by performed by running

    gap> TestPackage("difsets");

at the GAP command prompt. Note that the package name must be in lowercase.

## Documentation

Documentation for the package can be found in the `doc` subdirectory in html
form as `chap0.html` and pdf form as `manual.pdf`. Documentation can also be
accessed on the [package website][6] and through the standard GAP help system.
Documentation can be recompiled by running

    gap makedoc.g

in this directory.

## Results

Results for the group with ID [v, n] in the SmallGroups library are found in
the file `v-n.txt` in the directory `data/groups/v`. At the top of each file is
a header with the ID of the group, the total number of inequivalent difference
sets found, and the time required for the computation. For example, the group
SmallGroup(64, 260) has 30 difference sets up to equivalence. These sets can be
found in the file `data/groups/64/64-260.txt`. The header of this file
indicates that the computation took 40 hours, 5 minutes, and 38.020 seconds to
complete. A summary of timings is also listed in the file `groups.csv` in the
`data` directory.

The easiest way to access results is the `LoadDifferenceSets` function. With
the package loaded you can, for example, type

    gap> LoadDifferenceSets(16, 12);
    [ [ 1, 2, 3, 4, 5, 12 ], [ 1, 2, 3, 4, 8, 15 ] ]

to return a list containing representatives for the two difference sets up to
equivalence in SmallGroup(16, 12). For details, see the documentation.

The script `difsets`, also available in the `data` subdirectory, was used to
produce the result files. Calling

    ./difsets v n

will start a session of GAP, load the DifSets package, and compute the list of
inequivalent difference sets in SmallGroup(v, n). Output is then put in the
file `v-n.txt`. For example,

    ./difsets 16 4

produces the file `16-4.txt` that contains all the inequivalent difference sets
in group [16, 4].

## License

Copyright (C) 2017, 2019 Dylan Peifer

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Contact

For questions, comments, problems, and bugs, please contact the package author,
Dylan Peifer, at djp282@cornell.edu.

[1]: https://www.gap-system.org/
[2]: https://gap-packages.github.io/grape/
[3]: http://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc/index.html
[4]: https://gap-packages.github.io/smallgrp/
[5]: https://github.com/dylanpeifer/difsets/releases/download/v2.3.1/difsets-2.3.1.tar.gz
[6]: https://dylanpeifer.github.io/difsets/
