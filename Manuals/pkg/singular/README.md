[![Build Status](https://travis-ci.org/gap-packages/singular.svg)](https://travis-ci.org/gap-packages/singular)
[![Code Coverage](https://codecov.io/github/gap-packages/singular/coverage.svg)](https://codecov.io/gh/gap-packages/singular)

# singular: a GAP interface to Singular

<https://gap-packages.github.io/singular/>
   
This is the README file for the package `singular`; a GAP interface
to the computer algebra system Singular <https://www.singular.uni-kl.de/>.

The package has no maintainer at the moment. To make a version of the 
Singular package working under GAP 4.5, in 2011 a bug in the interface was
fixed by Paul Smith and a new package archive for the GAP 4.5 release was 
prepared in 2012 by Alexander Konovalov. Currently we do not plan any 
further development of this package. The rest of this file belongs to the 
README of the package from its previous release on 2006/07/23.

------------------------------------------------------------------------------

Installing `singular`:

1. unpack `singular.tar.gz` in the `pkg` subdirectory of the GAP root
   directory.

2. If the Singular executable is in your search path, then it is ok: GAP
   will find it. If not, edit the file `pkg/singular/gap/singular.g`: at
   the beginning of this file, the full path to the Singular executable
   on your system must be added. For instance:
   sing_exec:="/usr/local/bin/Singular";
   Alteratively, one can give this path inside a GAP session, with the
   same command.

3. It should work. From within GAP things are started with

        gap> LoadPackage("singular");
        true

4. The documentation is in the `doc` subdirectory: it is more up-to-date 
   than this README file.


------------------------------------------------------------------------------


Preliminary announcement of August 2003 (and preliminary documentation):

Dear Gap developers,
this is the announcement that the experimental version of the package
"singular" has been released.

This package, written by Willem de Graaf and myself, provides an interface
to the system Singular ("SINGULAR is a Computer Algebra system for
polynomial computations with emphasis on the special needs of commutative
algebra, algebraic geometry, and singularity theory.
SINGULAR's main computational objects are ideals and modules over a large
variety of baserings. The baserings are polynomial rings or localizations
thereof over a field (e.g., finite fields, the rationals, floats,
algebraic extensions, transcendental extensions) or quotient rings with
respect to an ideal.
SINGULAR features one of the fastest and most general implementations of
various algorithms for computing Groebner resp. standard bases. The
implementation includes Buchberger's algorithm (if the ordering is a well
ordering) and Mora's algorithm (if the ordering is a tangent cone
ordering) as special cases. Furthermore, it provides polynomial
factorizations, resultant, characteristic set and gcd computations, syzygy
and free-resolution computations, and many more related functionalities."
See https://www.singular.uni-kl.de/ . Singular is not included in the
package, but can be downloaded for free from that site.)

The package is available in the Gap CVS repository in the directory
4.0/pkg/singular.

Now (August 2003) all the warnings about the stuff in the CVS repository
apply. Further, this package can hang the Gap session (you will have to
type <ctrl>-C twice, and you will lose the content of the session, if it
was not saved with SaveWorkspace). This should not happen during normal
use (please report if it happens to you), but only with code designed to
hang Gap, such as
SingularLibrary("all");
SingularInterface("execute", ["pause()"], "def" );


Hints, bug reports, patches, requests of other functionalities, and so on
are welcome, please submit them at
<https://github.com/gap-packages/singular/issues>
Please add the output of SingularReportInformation(); to your report.

```
# load

LoadPackage("singular");


# specify the Singular executable (not needed if Singular is in the path)

sing_exec:= "/home/wdg/Singular/2-0-3/ix86-Linux/Singular";


# let's define some Gap objects

R:=PolynomialRing( Rationals, ["x", "y", "z"] : old );;
gen:=GeneratorsOfLeftOperatorRingWithOne(R);;
x:=gen[1];;y:=gen[2];;z:=gen[3];;
pol1:=-3*x*z^3+x^3+x*y*z;;
pol2:=-3*x^2*z^3+x^4+x^2*y*z-3*x*z^3+x^3+x*y*z;;
pol3:=x*y+x*z+x+y+z;;
I:=Ideal( R, [ pol1, pol2, pol3] );;


# set the basering in singular (this is done automatically by the other
# functions when the arguments are rings or ideals).

SingularSetBaseRing( R );


# Let be "Singfunc" the name of a function of Singular, and GapList a list
# of Gap objects. Then the function
#
# SingularInterface( "Singfunc", GapList, type_output );
#
# will convert the objects in the list GapList info Singular objects, will
# apply Singfunc to them from within Singular, and will convert to output
# back into a Gap objects.
# The argument type_output must be one of "def",
# "ideal", "int", "intmat", "intvec", "link", "list", "map", "matrix",
# "module", "number", "poly", "proc", "qring", "resolution", "ring",
# "string", "vector", and tells to the interface the type in Singular of
# the output of Singfunc. In doubt you can use "def".
# See in the documentation of Singular the chapter "4. Data types".

SingularInterface( "jacob", [ pol1 ], "ideal" );
SingularInterface( "dim", [ I ], "int" );
SingularInterface( "std", [ I ], "ideal" );

# when the output is an ideal, use GeneratorsOfTwoSidedIdeal to get the
# generators.


# this calculates the Groebner Basis

GroebnerBasis( I );


# sometimes we need only to know whether the Groebner Basis is trivial
# (i.e. equal to the unit) or not.

HasTrivialGroebnerBasis( I );


# This loads (in Singular) the library general.lib

SingularLibrary( "general.lib");


# the gcd of polynomials (also multivariate ones)

GcdUsingSingular( pol1, pol2, pol3 );


# factorizations of polynomials (also multivariate ones)

FactorsUsingSingularNC( pol1 );


# this checks also the output of Singular

FactorsUsingSingular( pol2 );


# As i/o streams do consume system resources, and only a limited number
# can be open at any time, it is wise to close Singular when it will be
# not needed anymore.

CloseSingular();

# Singular will start again when one of the functions above is called, or
# by StartSingular();

# Not that the time used by Singular is not reported by the function 
# Runtimes(); until the Singular session is terminated. The cpu time resp. 
# the wall clock time used by a singular session can by get with:

Int( SingularCommand( "", "timer" ) );
Int( SingularCommand( "", "rtimer" ) );
```


Greetings,
Marco Costantini

------------------------------------------------------------------------------

Addendum

** Reserved chars or strings:

Don't use the following chars or strings with the interface:

@	marks the end of the Singular output

'	delimits the useful Singular output 

$	the interface discards all the '$' sent to Singular

GAP_...	all the names of the Singular variables defined by the interface 
	begin with "GAP_": don't use these names for your variables




** Type conversions:

```
type    Gap -> Singular                 Singular -> Gap
        * := sets basering              U := only on Unix or with Gap >=4.4.2

def     (no sense)                      U (ask Singular for the type)
ideal   *ParseGapIdealToSingIdeal       done
int     ParseToSingInt                  Int
intmat  ParseGapIntmatToSingIntmat      U done
intvec  ParseGapIntvecToSingIntvec      done
link                                    U (done)
list    ParseGapListToSingList          U done
map	(planned)
matrix  done                            U done
module	*ParseGapModuleToSingModule	(U) done
number  ParseGapNumberToSingNumber      ParseSingNumberToGapNumber
poly    ParseGapPolyToSingPoly          ParseSingPolyToGapPoly
proc                                    U ParseSingProcToGapFunction
qring
resolution
ring    *ParseGapRingToSingRing         (planned)
string  done                            x->x;
vector  ParseGapVectorToSingVector      (U) done
```
