---
title: Links to Other Systems
grand_parent: About
parent: Capabilities
layout: default_with_title
permalink: /capabilities/links
---

The world of computational algebra is wide, GAP has been collaborating with various other systems and there are many different ways that GAP interfaces with external systems.

These include:

- An interface to  [PARI/GP](http://pari.math.u-bordeaux.fr/) system 
  in the [Alnuth](https://gap-packages.github.io/alnuth) package.

- An interface
  [singular](https://gap-packages.github.io/singular/) to the
  [SINGULAR](http://www.singular.uni-kl.de) system for
  algebraic geometry, allowing to apply the functions of SINGULAR to
  the objects of GAP, allowing in particular fast
  computation of
  Groebner bases, computation of gcd and factorization of multivariate
  polynomials, as well as computation of invariant rings of finite
  groups.

- A GAP package 
  [openmath](https://gap-packages.github.io/openmath) 
  allowing GAP users to import and export
  mathematical objects encoded in 
  [OpenMath](http://www.openmath.org/), for the purpose of 
  exchanging them with other applications which are OpenMath enabled. 

-  A GAP package 
  [SCSCP](https://gap-packages.github.io/scscp) which implements the 
  [Symbolic Computation Software Composability Protocol](https://openmath.org/standard/scscp/). 
  Using it, GAP can communicate locally or remotely with any other 
  OpenMath-enabled SCSCP-compliant application which may be not only another computer algebra 
  system but also another instance of the GAP system or even, for example, an external 
  Java or C/C++ application that uses SCSCP API. 

- An interface
  [DISCRETA - GAP](http://www.mathe2.uni-bayreuth.de/discreta/GAP/discreta_gap.html) to the program 
  [DISCRETA](http://www.mathe2.uni-bayreuth.de/discreta/)
  for  the construction of t-designs   with   prescribed  automorphism 
  group   by  A.   Betten, E. Haberberger, R. Laue, and A. Wassermann.
  This interface is provided by 
  [Anton Betten](http://www.math.colostate.edu/~betten).

- An interface to the [4ti2](http://www.4ti2.de/) package for
  algebraic, geometric and combinatorial problems on linear spaces
  in the [4ti2Interface](https://homalg-project.github.io/pkg/4ti2Interface) package.

- The [PolymakeInterface](https://gap-packages.github.io/polymaking/) package
  provides a link to the callable library of the
  [polymake](http://www.polymake.org/) system.

<!--

- The computer algebra system SAGE (available from
  [http://www.sagemath.org](http://www.sagemath.org/)
  and its mirrors) includes GAP, though packages, 
  and libraries, such as the smallgroups library and the table of marks, 
  must be installed separately. SAGE also includes (i.a.) 
  - [Singular](http://www.singular.uni-kl.de/),
  - [Pari](http://pari.math.u-bordeaux.fr/), 
  - the number theory library  [NTL](http://www.shoup.net/ntl/), 
  - [Maxima](http://maxima.sf.net/), 
  - [Python](http://www.python.org/), the programming language it uses. 

  Two webpages explaining ways in which SAGE interacts with GAP are the 
  section "Programming SAGE using GAP" in the
  [SAGE Developers Guide](http://www.sagemath.org/doc/developer/)
  and the section "The GAP Interface" in the
  [SAGE Reference Manual](http://www.sagemath.org/doc/reference/).

  For questions, please email 
  [William Stein](http://wstein.org/) (the main author of
  SAGE, wstein@gmail.com) or 
  [David Joyner](http://www.opensourcemath.org/) (wdjoyner@gmail.com), or join the 
  [SAGE email lists](http://www.sagemath.org/help-groups.html).
-->
