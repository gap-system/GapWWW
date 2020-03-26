[![Build Status](https://travis-ci.org/gap-packages/PatternClass.svg?branch=master)](https://travis-ci.org/gap-packages/PatternClass)
[![Code Coverage](https://codecov.io/github/gap-packages/PatternClass/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/PatternClass)

The 'PatternClass' GAP 4 package
================================

!!!!!!!!!!!!!!
! Patch info !
!!!!!!!!!!!!!!
We had to patch the IntersectionAutomaton, UnionAutomata and ProductLanguage
from the Automata pkg (version 1.13) to improve performance testing. The
patched functions are located in lib/automata.* .

Introduction
------------

This is version 2.4.2 of the 'PatternClass' package.

The 'PatternClass' package allows you to explore the permutation
pattern classes build by token passing networks.
Amongst other things, 'PatternClass' can compute the basis of a
permutation pattern class et vice versa, rank encode and decode permutations,
create automata from token passing networks and checking if the
deterministic automaton is a possible representative of a
token passing network.
More details on what functions "PatternClass' contains, consult
the manual in the doc folder.

If there are any problems with the package please do not hesitate to contact us.

Michael Albert	 <malbert@cs.otago.ac.nz>
Steve Linton 	 <sl4@st-andrews.ac.uk>
Ruth Hoffmann	 <rh347@icloud.com> (Current maintainer)


Contents
--------

This package comes with the following files and directories

    doc             the directory with the manual
    init.g          this file does initialise the package
    lib             this directory contains all GAP code
    lib/grid        this directory contains experimental code which is not preloaded
                    see README in lib/grid for info
    PackageInfo.g   the information file for automatic processing
    read.g          this file reads the package
    README          you are currently reading this file

Unpacking and Installing 'PatternClass'
---------------------------------------

If you get 'PatternClass' as a compressed file unpack it in the pkg/ folder
in the gap4r4 folder where GAP is installed on your computer.
To uncompress the .tar.gz file on UNIX use the following command

   tar xzf PatternClass2.4.2.tar.gz

If your version of tar does not support the z option use

   gunzip PatternClass2.4.2.tar.gz
   tar xf PatternClass2.4.2.tar

This will create the folder PatternClass in pkg/ and within that
you will find the directories and files mentioned above.

To use the package within GAP, run GAP and type the following

gap> LoadPackage("patternclass");
----------------------------------------------------------------
Loading  Automata 1.13
For help, type: ?Automata:
----------------------------------------------------------------
─────────────────────────────────────────────────────────────────────────────
Loading  PatternClass 2.4.2 (A permutation pattern class package)
by Ruth Hoffmann (https://rh347.host.cs.st-andrews.ac.uk/),
   Steve Linton (http://sal.host.cs.st-andrews.ac.uk/), and
   Michael Albert (http://www.cs.otago.ac.nz/staff/michael.html).
Homepage: https://gap-packages.github.io/PatternClass/
─────────────────────────────────────────────────────────────────────────────
true
gap>

Now you can use all functions of 'PatternClass' within this session
of GAP. As described in the manual, found in the doc directory or
online or within GAP help.



Changes
-------
Changes from 2.4 to 2.4.2:
- Changed the name of HashSet due to clash with DataStructure Package
- Removed TODOs from code
<<<>>><<<>>><<<>>><<<>>>

Changes from 2.3 to 2.4:
- Improved the runtime of InbetweenPermSet when the subpermutation is of length 1.
- Added IsSumPerm function
- Fixed&merged issues
<<<>>><<<>>><<<>>><<<>>>

Changes from 2.2 to 2.3:
- Added functions to create the language and set of permutations contained between two permutations.
<<<>>><<<>>><<<>>><<<>>>

Changes from 2.1 to 2.2:
- Updated the way testing is being done in preparation for GAP4.8.
<<<>>><<<>>><<<>>><<<>>>

Changes from 2.0 to 2.1:
- Removed all unnecessary files from the archive.
- Fixed PackageInfo, such that no warnings are thrown.
<<<>>><<<>>><<<>>><<<>>>

Changes from 1.12358132134 to 2.0:
- Package is now being hosted on GitHub!
- Updated maintainers details
- Changed version numbering to a simpler system.
<<<>>><<<>>><<<>>><<<>>>

Changes from 1.123581321 to 1.1235813213455:
- Fixed up PackageInfo.g for submission to GAP distribution.
<<<>>><<<>>><<<>>><<<>>>

Changes from 1.1235813 to 1.123581321:
- Fixed up some small editorial faults (copyright, authors etc.)
<<<>>><<<>>><<<>>><<<>>>

Changes from 1.12358 to 1.1235813:
- Cleaned up some code.
- Moved the alternative automaton theoretic functions into their own file
- Introduced tests for the pkg
<<<>>><<<>>><<<>>><<<>>>

Changes from 1.1235 to 1.12358:
- Fixed issues with the experimental code from lib/grid by not loading the code
automatically. At their own discretion.
<<<>>><<<>>><<<>>><<<>>>

Changes from 1.123 to 1.1235:
- The undocumented functions for chains of simple permutations are now documented.
- The experimental code on grid classes is moved into a separate folder, these
functions are undocumented.
- Patched code for Automata functions UnionAutomata, IntersectionAutomaton and
ProductOfLanguages has been added.
- Some code has been changed to use the patched functions, and general code
cleaning has been done in places.

<<<>>><<<>>><<<>>><<<>>>

Changes from 1.12 to 1.123:
- Functions for the regular language of simple permutations have been added.
- Fix of SequencesToRatExp, there was an issue when the alphabet exceeded 9 letters.
- Undocumented functions for chains of simple permutations have been added.

<<<>>><<<>>><<<>>><<<>>>

Changes from 1.1 to 1.12:

- The following functions have been added:
   * IsInterval - Checker whether the input sequence is an interval.
   * Inflation - Returns a permutation that is represented by the
      input list of permutations.
   * Block-Decomposition - Returns the unique (for some permutations)
      list of permutations representing the input permutation in a
      truncated format.

<<<>>><<<>>><<<>>><<<>>>

Changes from 1.0 to 1.1:

- Improvement in BoundedClassAutomaton

- Additional functions checking whether a permutation is
   * plus-decomposable
   * minus-decomposable
   * simple

- Functions to build the rational subsets of a class accepting
  all plus- (minus-) decomposable permutations (also indecomposable
  permutations)

- Functions to check whether the input list is
   * a valid rank encoding
   * a rank encoding stemming from the input class

- A function calculating the complement of a permutation

- Functions to calculate the direct sum or the skew sum of 2 permutations

- A function calculating the direct sum for 2 rational pattern classes

- A function to build the automaton that accepts all permutations under the
  rank encoding that have the same number of inversions.

- A function that builds the subclass containing all permutations with the
  same number of inversions in the class.
