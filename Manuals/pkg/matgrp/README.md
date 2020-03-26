The matgrp package provides an implementation of a method for
FittingFreeLiftSetup for matrix groups over finite fields or integer residue
class rings, using the recog package. It will work for matrix groups
over finite fields, as well as over residue class rings ``Integers mod n''.
It is provided as a package, as it requires other packages (recog, and its
dependencies) to be installed.

Download from
http://www.math.colostate.edu/~hulpke/matgrp/

It is Copyright (C) 2016-20 by Alexander Hulpke
It is licensed under GPL v2 or v3. (see http://gnu.org/licenses/gpl.html)

At this point no methods for functions (such as ConjugacyClasses) exist
that automatically apply to matrix groups. However if calling
FittingFreeLiftSetup on a matrix group first, afterwards certain 
operations (such as ConjugacyClasses and MaximalSubgroupClassReps) will 
apply with Solvable radical methods.

The code is still in beta test stage. It is possible that error messages
arise when computing the initial data structure. (Some of these are due to
the recog package) In such a case simply call the command again.

                                                             Alexander Hulpke
