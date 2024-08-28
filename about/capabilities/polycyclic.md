---
title: Polycyclic Groups
grand_parent: About
parent: Capabilities
layout: default_with_title
nav_order: 6
permalink: /capabilities/polycyclic
---

Polycyclic groups (both finite and infinite) have special generating
sets which are compatible with the polycyclic structure of the underlying
group. These allow highly efficient computation in polycyclic groups. For
example, there are effective algorithms available to compute:

- centralizers of elements
- normalizers of subgroups
- intersections of subgroups
- complements to normal subgroups
- cohomology groups

Methods for this purpose are contained in the main GAP
library for finite polycyclic groups and in the
[Polycyclic](https://gap-packages.github.io/polycyclic/) package
for arbitrary polycyclic groups.

The main GAP library also contains methods for special
structure investigations in finite soluble groups such as the computation
of Hall subgroups, Sylow systems and maximal subgroups. The packages
[FORMAT](https://gap-packages.github.io/format/) and
[CRISP](http://www.icm.tu-bs.de/~bhoeflin/crisp/index.html)
extend this to the computation of all kinds of formation and Schunk
classes related structures.

The [Polycyclic](https://gap-packages.github.io/polycyclic/) package also
contains methods for special structure investigations in infinite
polycyclic groups such as the computation of the Hirsch length,
the torsion subgroup (if it exists) or a torsion free normal
subgroup of finite index. It utilizes an interface to the
[PARI/GP](http://pari.math.u-bordeaux.fr/) system from
the [Alnuth](https://gap-packages.github.io/alnuth) package.

For finite polycyclic groups it is also possible to determine the
automorphism group or a minimal generating set. The
[AutPGrp](https://gap-packages.github.io/autpgrp/)  package
contains a particularly effective method to determine
the automorphism group of a finite *p*-group.

The package [Polenta](https://gap-packages.github.io/polenta/)
allows to determine a polycyclic presentation for
polycyclic matrix groups over finite fields or the rational numbers.
The main GAP library contains a method to determine a polycyclic
presentation for permutation groups.
The [nq](https://gap-packages.github.io/nq/) and [ANUPQ](https://gap-packages.github.io/anupq/)
packages contain methods to determine polycyclic presentations for nilpotent
or p-group quotients of finitely presented groups, respectively.
