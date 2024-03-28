---
title: Algebras
grand_parent: About
parent: Capabilities
layout: default
nav_order: 8
permalink: /capabilities/algebras
---
## Vector Spaces, Modules and Algebras

{%- include ref.html label="Vector Spaces" %} over {%- include ref.html label="Fields and Division Rings" text="fields" %} and {%- include ref.html label="Modules" text="modules" %} over {%- include ref.html label="Rings" text="rings" %} can be defined when the coefficient domain is available in GAP. Note, however, that the range of implemented methods will depend on the coefficient domain.

There are algorithms for the efficient calculation of Hermite and Smith {%- include ref.html label="Normal Forms over the Integers" text="normal forms" %} over the integers (see also the package [EDIM](https://www.math.rwth-aachen.de/~Frank.Luebeck/EDIM)).

Computations concerning special modules arising in representation theory
are possible. The [hecke](https://gap-packages.github.io/hecke/) package
allows dealing with Specht modules.

{%- include ref.html label="Lie Algebras" %}
can be given by structure constants, by generating matrices or by
a finite presentation. There are routines for computing the structure 
of finite dimensional Lie algebras, in particular
there are functions for computing Cartan subalgebras,
the direct sum decomposition, a Levi decomposition, the solvable radical
and nil radicals. 

Much of the support for Lie  algebras is based on more general methods
using  an implementation  of the  arithmetic operations  via structure
constants,  which  works  for  any  finite  dimensional  algebra.   In
particular, associative {%- include ref.html label="Algebras" text="algebras" %} (e.g., group rings, cf. the manual chapter {%- include ref.html label="Magma Rings" %}) are also supported. 

Investigation of algebras given by presentations are currently restricted to Lie algebras using the package [FPLSA](https://gap-packages.github.io/FPLSA); associative algebras will have to wait for a GAP 4 implementation of the vector enumeration method.

The  package  [Sophus](https://gap-packages.github.io/sophus/) deals  with 
nilpotent Lie algebras over prime fields allowing to construct central 
extensions and to determine their automorphism groups.

The package [QuaGroup](https://gap-packages.github.io/quagroup/) allows to 
investigate quantum groups.

On the home page of [Jan Draisma](https://mathsites.unibe.ch/jdraisma/) functions for working with the Weyl algebra and for the realisation of Lie algebras by means of derivations are found.

Four new packages for Lie algebras appeared in GAP 4.7 
distribution:
- The package [CoReLG](https://gap-packages.github.io/corelg/) for calculations in real semisimple Lie algebras.
- The package [LieRing](https://gap-packages.github.io/liering/) for constructing finitely-presented Lie rings and calculating the Lazard correspondence. The package also provides a database of small $n$-Engel Lie rings.
- The package [LiePRing](https://gap-packages.github.io/liepring/), introducing a new datastructure for nilpotent Lie rings of prime-power order. This allows to define such Lie rings for specific primes as well as for symbolic primes and other symbolic parameters. The package also includes a database of nilpotent Lie rings of order at most $p^7$ for all primes $p> 3$.
- The package [SLA](https://gap-packages.github.io/sla/) for computations with simple Lie algebras. The main topics of the package are nilpotent orbits, theta-groups and semisimple subalgebras.

The package [LAGUNA](https://gap-packages.github.io/laguna) allows to investigate unit groups of the modular group algebra of a $p$-group and Lie algebras associated with associative algebras. It is extended by the [UnitLib](https://gap-packages.github.io/unitlib) package providing a library of unit groups of modular group algebras of $p$-groups of small order.

The package [Wedderga](https://gap-packages.github.io/wedderga) computes the simple components of the Wedderburn decomposition of semisimple group algebras of finite groups over finite fields and over subfields of finite cyclotomic extensions of rationals. It also contains functions that produce the primitive central idempotents of semisimple group algebras. It also provides the functionality to construct crossed products.

The package [ModIsom](https://gap-packages.github.io/modisom/) contains various methods for computing with nilpotent associative algebras. In particular, it contains a method to determine the automorphism group and to test isomorphisms of such algebras over finite fields and of modular group algebras of finite $p$-groups. Further, it contains a nilpotent quotient algorithm for finitely presented associative algebras and a method to determine Kurosh algebras.
