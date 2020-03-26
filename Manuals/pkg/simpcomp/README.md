# The GAP 4 package simpcomp

## About

`simpcomp` is a GAP package for working with simplicial complexes.
It allows the computation of many properties of simplicial
complexes (such as the f-, g- and h-vecors, the face lattice,
the automorphism group, (co-)homology with explicit basis
computation, intersection form, etc.) and provides the user with
functions to compute new complexes from old (simplex links and
stars, connected sums, cartesian products, handle additions,
bistellar flips, etc.). Furthermore, it comes with an extensive
library of known triangulations of manifolds and provides the
user with the possibility to create own complex libraries.
`simpcomp` caches computed properties of a simplicial complex, thus
avoiding unnecessary computations, internally handles the vertex
labeling of the complexes and insures the consistency of a
simplicial complex throughout all operations. `simpcomp` relies on
the GAP package `homology` for its homology computation, but also
provides the user with an own (co-)homology algorithm in case
`homology` is not available. For automorphism group computation
the GAP package `GRAPE` is used, which in turn uses the program
`nauty` by Brendan McKay. An internal automorphism group
calculation algorithm in used as fallback if `GRAPE` is not
available.

## License

`simpcomp` is free software. The code is released under the GPL
version 2 or later (at your preference). For the text of the GPL
see the file COPYING in the `simpcomp` directory or
[http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).

## Dependencies

- `GAP` (>=4.4)
- Depending on GAP packages: `GAPDoc` (>= 0.9999), part of the core
  GAP system.
- Strongly suggested other packages: `Homology` (>= 1.4.2),
  `GRAPE` (>= 4.2)


## Download and installation

- Install the [GAP](http://www.gap-system.org) system, 
  version 4.5 or higher.

- (Optional) Download the current [simpcomp](https://github.com/simpcomp-team/simpcomp)
  Version (This step is only required if you want to use features of `simpcomp`
  which are not yet included in the official release). Copy folder `GAPROOT/pkg/simpcomp`
  to `GAPROOT/pkg/simpcomp-old` and unpack the archive to the directory
  `GAPROOT/pkg/` (default for `GAPROOT` is `/usr/local/lib/gap4r5`).

- (Optional) Run `./autogen.sh; ./configure; make; make install; make clean`
  (This step is only required if you want to use `SCReduceComplexFast()`).
  You may need admin rights to perform this step.

- From within `GAP`, load `simpcomp` using the following command which should
  return `true`. Based on which packages are already loaded, you
  will see something like the following:

<pre>
  gap> SCLoadPackage("simpcomp");
  ─────────────────────────────────────────────────────────────────────────
  Loading  AutoDoc 2014.08.21 (Generate documentation from GAP source code)
  by Sebastian Gutsche (http://wwwb.math.rwth-aachen.de/~gutsche/) and
     Max Horn (http://www.quendi.de/math).
  Homepage: http://wwwb.math.rwth-aachen.de/~gutsche/gap_packages/AutoDoc
  ─────────────────────────────────────────────────────────────────────────
  ...
  ─────────────────────────────────────────────────────────────────────────
  Loading  GRAPE 4.6.1 (GRaph Algorithms using PErmutation groups)
  by Leonard H. Soicher (http://www.maths.qmul.ac.uk/~leonard/).
  Homepage: http://www.maths.qmul.ac.uk/~leonard/grape/
  ─────────────────────────────────────────────────────────────────────────
  Loading simpcomp 2.1.10
  by F.Effenberger and J.Spreer
  https://github.com/simpcomp-team/simpcomp/
  true
</pre>

- Run `SCRunTest();` for a quick self test of `simpcomp` that assures the package
  works correctly. The output of the test function should look like this (the
  number printed after `GAP4stones` is a performance measure of your system and
  thus may differ from computer to computer):

<pre>
  gap> SCRunTest();
  + simpcomp package test
  + GAP4stones: 28579
  true
</pre>

- If you want `simpcomp` to automatically load upon `GAP` startup, either set the
  variable `Autoload:=true` in `GAPROOT/pkg/simpcomp/PackageInfo.g` (in line ~94)
  or add the command `LoadPackage("simpcomp");` to your `~/.gaprc`.

## Changes


03/06/2019 - Version 2.1.10: MINOR UPDATE
- Added generated files to archive
- Added check for executable bistellar
- Deleted README and duplicate GPL file

21/10/2018 - Version 2.1.9: MINOR UPDATE
- Minor changes in documentation/manual
- Adjusted output of test file for GAP 4.10
- Installed gh-pages via GitHubPagesForGAP
- Repaired complex library, removed double entry
- Fixed bug in SCIsLibRepository
- Streamlined building process of binary "bistellar" to comply with BuildPackages.sh

05/02/2018 - Version 2.1.8: MINOR UPDATE
- Minor changes in documentation/manual
- Adjusted output of test file for GAP 4.9

29/09/2017 - Version 2.1.7: Minor update
- Adjusted SCRunTest (simpcomp testing facility)
- Minor changes in documentation/manual
- Added characterisation of tight 3-manifolds to SCIsTight (see http://arxiv.org/abs/1601.00065)
- Fixed bug in SCIsFlag

01/02/2016 - Version 2.1.6: Minor update
- Minor changes in documentation/manual

22/01/2016 - Version 2.1.5: Minor update
- Minor changes in documentation/manual
- Added characterisation of tight 3-manifolds
  to SCIsTight (see http://arxiv.org/abs/1601.00065)

23/12/2015 - Version 2.1.4: Minor update
- Fixed minor bug in SCsFromGroupByTransitivity();

04/06/2015 - Version 2.1.1: Minor update
- Minor changes in documentation/manual

20/05/2015 - Version 2.1.0: Major update, support for discrete
             Morse theory added
- Fixed bug in SCFVector, non-manifolds where treated like the simplex or the
  boundary of the simplex
- Improved collapsing sequence (it is now using a Hasse diagram,
  SCIntFunc.SCHasseDiagram())
- Improved high dimensional bistellar moves flip strategy (both for
  SCReduceComplex() and SCReduceComplexFast())
- Updated references
- Added chapter about discrete Morse theory in documentation
- Added support for discrete Morse theory (SCHasseDiagram, SCMorseEngstrom,
  SCMorseRandom, SCMorseUST, SCMorseSpec, SCMorseRandomLex, SCMorseRandomRevLex)
- Added Wilson's algorithm for uniform spanning trees SCSpanningTreeRandom
- Added new functionality based on discrete Morse theory: SCHomologyEx,
  SCHomology, SCIsSphere, SCIsManifold
- Old homology and manifold verification code is now available under
  SCHomologyClassic and SCBistellarIsManifold
- Fixed bug in SCSkelEx and improved performance
- Fixed bug in SCCyclic3Mfld(22,X), X = 1437, 2087, 2660, 2827, 2844, 3079
- Fixed bug in SCMove for d-moves
- Fixed bug in SCStronglyConnectedComponents and improved performance
- Fixed bug in SCNumFaces
- Improved functions SCIsPseudoManifold, SCHasBoundary, SCBoundarEx and
  SCBoundary

12/12/2013 - Version 2.0.0: FIRST RELEASE AS GAP SHARED PACKAGE
- Added functions SCExportIsoSig, SCExportToString, SCFromIsoSig for isomorphism
  signature support and compressing
- Added infinite family of transitive triangulations (S2xS2)^k (function
  SCSeriesS2xS2(k))
- Added function SCExportRecognizer to export 3-manifolds to Matveev's
  3-manifold recognizer

31/01/2013 - Version 1.6.1: Minor update.
- Fixed minor bug in SCChiralMap and SCRegularMap.
- Updated deployment system.

22/01/2013 - Version 1.6.0: Major update.
- Added functions SCHeegaardSplitting, SCHeegaardSplittingSmallGenus and
  SCIsHeegaardSplitting to handle Heegaard splittings.
- Added infinte series of d-tori SCSeriesTorus.
- Added infinte series of lens spaces SCSeriesLensSpace.
- Fixed bug in SCLibDelete.
- Recalculated examples of documentation.
- Fixed inconsistency in SCsFromGroupExt (non-strongly connected
  2-pseudomanifolds are now all computed).
- Added external code for bistellar flips.
- Fixed bug in SCOrientation.
- Added function SCSeriesBrehmKuehnelTorus.
- Fixed minor bug in SCCartesianProduct (typo in description of
  topological type).
- Added classification of cyclic combinatorial 3-mflds up to 22 vertices.
- Added K3-surface K3_17 with standard PL-structure to the library.
- Fixed bug in SCIntersectionFormSignature.
- Revised documentation.
- Added SCSurface, generates a surface of prescribed orientability and genus.
- Added SCDifferenceCycles (analogue of SCGenerators for cyclic combinatorial
  manifolds).
- Added census of highly symmetric surfaces. This includes the functions:
  SCNrRegularTorus, SCNrChiralTori, SCRegularTorus, SCChiralTori,
  SCSeriesSymmetricTorus, SCRegularMap, SCChiralMap, SCRegularMaps and
  SCChiralMaps.
- Fixed dependencies on external UNIX programs to avoid problems with
  simpcomp running under Windows.
- Added further combinatorial 3-manifolds with transitive cyclic symmetry.
  In particular, added functions SCSeriesHomologySphere, SCSeriesConnectedSum,
  SCSeriesSeifertFibredSpace and extended SCSeriesLensSpace.
- New deployment system for full support of Google Code Git repository.

23/11/2011 - Version 1.5.4: GAP 4.5 release: required GAP-version is now 4.5
- Updated references to other packages

28/10/2011 - Version 1.5.3: Tiny update
- Replaced test file in PackageInfo.g

27/10/2011 - Version 1.5.2: Minor update
- Fixed bug in function SCNumFacesOp
- Fixed bug in function SCsFromGroupExt
- Removed unnecessary .git subdirectory from package archive

27/10/2011 - Version 1.5.2: Minor update
- Fixed bug in function SCNumFacesOp
- Fixed bug in function SCsFromGroupExt
- Removed unnecessary .git subdirectory from package archive

16/08/2011 - Version 1.5.1: Minor update
- Added the GAP package ''io'' to the list of ''NeededOtherPackages''.
- Fixed bug in function SCMove (thanks to Paul VanKoughnett for reporting!), bistellar move was performed on argument, too.
- Fixed bug in shelling code (thanks to Samuel Kolins for reporting!),
  shelling intersection was not checked for pureness.
- Extended SCExportJavaView to work with higher-dimensional complexes.
  For complexes of dim > 2, the 2-skeleton is exported now.
- Added new series of triangulations of certain Hamiltonian subcomplexes
  of the cross polytope in arbitrary dimension: SCSeriesBid.

01/06/2011 - Version 1.5.0: Major update. Reworked most parts of package.
- Completely rewritten type system, simpcomp is now compliant to the
  standard GAP object format. Introduced new object type
  SCPolyhedralComplex, from which both SCSimplicialComplex and
  SCNormalSurface are derived.
- Changed naming of .-operator for simpcomp objects -- now there exist
  short and long versions of method names.
- SCFaces and operator [] for polyhedral complex are now synonyms for
  SCSkel.
- Vertex labels must now be elements with a total ordering.
- Changed behaviour of operator = for SCSimplicialComplex: complexes
  are now only equal if and only if they have the same facet lists
  in standard labelling 1..n (used to include combinatorial isomorphy).
- Fixed bug in SCRelabel... functions. As a side-effect, function
  SCSortComplex was deprecated and is now gone.
- Fixed serveral small bugs in the classification functions for
  transitive manifolds with the prefix SCs...  -- now all manifolds
  should be found.
- Heavily reworked SCsFromGroup...-functions, should be much faster now.
- Added and changed a lot of new functionality reagarding infinite
  series of triangulations, function prefix SCSeries...
- Changed file format to binary one. Note that SCSave/SCLoad now use
  the binary format. If you want to continue using XML, use
  SCSaveXML/SCLoadXML. The package falls back to old format where
  neccessary.
- Fixed bugs in SCDetermineTopologicalType and SCSpanningTree reported
  by Jack Schmidt (thank you!). In some cases, the spanning tree was
  not computed correctly. SCDetermineTopological did not work
  correctly with user libraries.
- SCIsInKd now only checks one link if the complex has a transitive
  automorphism group.
- Fixed polymake export/import SCExportPolymake/SCImportPolymake.
- Fixed small bug in SCAutmorphismGroupInternal.
- Changed the way the documentation is generated (using GAPDoc) --
  the examples should now always be up to date and in sync with the code.
- Changed package tests. Got rid of testshort.gap and testall.gap, the
  only function you need from now on is SCRunTest().
- Added interface to GAP package "homalg" by Mohamed Barakat -- the
  package can now be used for homology-related computations. In particular,
  simpcomp can now calculate homology groups with arbitrary coefficients
  using homalg.

17/08/2010 - Version 1.3.3: Minor bug-fix
- Adjusted test files to accommodate some changes made in the
  versions 1.3.1 and 1.3.2

12/08/2010 - Version 1.3.2: Minor bug-fix
- Fixed dependencies on other packages

05/08/2010 - Version 1.3.1: Minor bug-fix
- Fixed minor issues with undeclared local variables
- Fixed wrong output format of SCAutomorphismGroupInternal

26/05/2010 - Version 1.3.0: Major update.
             New functions, updated library and bug fixes.
- simpcomp has learned to generate all triangulations with k-transitive
  automorphism groups given a prescribed dimension and vertex number. See the
  function prefix SCsFromGroup.
- Expanded the library to also contain pseudomanifolds -- the library now
  contains ca. 650 manifolds and ca. 7000 pseudomanifolds, it indexes the
  properties IsManifold and IsPM and supports them in property-based searches.
- SCExportLatexTable now uses SCFacets instead of SCFacetsEx and thus respects
  vertex labelings. Take care not to choose to wild labels though, these are not
  checked for latex compatibility during the export.
- Changed naming scheme of automorphism groups -- StructureDescription is only
  called if the group cannot be found in GAPs group libraries out of speed
  considerations.
- Fixed small error in SCIntFunc.ReadPermGroup resulting in an error when trying
  to load complexes with trivial automorphism groups

30/04/2010 - Version 1.2.73: Midsize update. simpcomp now has a mascot!
- Added support for polyhedral Morse functions, prefix: SCMorse...,
  including a (naive) test for tightness of a triangulation (SCIsTight).
- Minor updates of the complex library.

07/04/2010 - Version 1.1.43
- IMPORTANT FIX: fixed incorrect calculation of g-vectors (last entry was
  missing) and updated library accordingly
- Added SCDehnSommervilleCheck and SCDehnSommervilleMatrix
- Added SCFVectorBdCyclicPolytope and SCBdCyclicPolytope
- Removed cyclic polytopes from library (see above)
- Added SCIsFlag to check whether a complex is flag
- Added SCRandomize to support randomizing of complexes via bistellar moves
- Again modified f-vector routine; should be faster now
- SCFromGenerators now saves the automorphism group to the complex
- Fixed small error in SCSortComplex

14/01/2010 - Version 1.1.21
- Improved performance of f-vector calculation (does not need face lattice
  any more)

26/11/2009 - Version 1.1.9
- Fixed loading errors of package when package `homology' is not loaded
- Added support for normal surfaces, along with additional documentation
- Complexes in library updated

16/11/2009 - Version 1.0.440
- Updated file and directory attributes to comply with GAP standard.
- Added function SCIntersectionFormSignature. Thanks to Michael Eisermann for
  helpful comments on calculating signatures of matrices without the need of
  calculating eigenvalues.

11/11/2009 - Version 1.0.435
- Updated Documentation
- Updated GRAPE availability test to reliably work with GRAPE 4.3

26/10/2009 - Version 1.0.403
- Minor compatibility fixes in this release
- Fixed some error messages on undefined global variables during loading of 		
  simpcomp when the packages `homology' and/or `GRAPE' are not present
- Fallback to functions of `homology' package are now handled correctly
- Added extended testing functionality and SCRunTest

13/10/2009 - Version 1.0.389
- Initial version


## Roadmap

The following features are planned to be supported in future versions of
simpcomp:

 - Better simplification strategies
 - Coverings (finite index subgroups)
 - Presentation two-complex (from fp-group)

		
## Bugs


We have thorougly tested simpcomp on errors. If you none the less encouter
errors or inconsistencies when working with simpcomp, please contact the
authors.

## Contact

Felix Effenberger, exilef@gmail.com

and

Jonathan Spreer, jonathan.spreer@sydney.edu.au

Address:
School of Mathematics and Statistics F07
The University of Sydney
NSW 2006 Australia 
