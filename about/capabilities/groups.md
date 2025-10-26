---
title: Groups
fulltitle: Groups and Group Elements
grand_parent: About
parent: Capabilities
layout: default_with_title
nav_order: 3
permalink: /capabilities/groups
---

Groups can be given in various forms: for example as
{% include ref.html label="Permutation Groups" text="permutation groups" %} or
{% include ref.html label="Matrix Groups" text="matrix groups" %} (by generating elements), as
{% include ref.html label="Finitely Presented Groups" text="finitely presented groups" %} or as
{% include ref.html label="Pc Groups" text="polycyclicly presented groups" %}.
GAP knows how to construct a number of well-known groups
such as symmetric and classical groups and to fetch concrete groups from
{% include ref.html label="Group Libraries" text="group libraries" %}.

There is a wide variety of functions for the investigation of groups.
Some of these functions just build on the concept of a group while others
(usually the more efficient ones, for instance nearly linear methods for
permutation groups) utilize the way in which a particular group is given.
GAP tries automatically to select a good method, but the
user can take over full control of this
{% include ref.html label="Method Selection" text="selection of methods" %}. Also, if
no deterministic method exists (e. g., for determining the order of an
fp-group) GAP will try to find an isomorphism to a group
it can handle (in the above case it will try to find an isomorphism to a
permutation group using the Todd-Coxeter method).

There are many functions to compute
{% include ref.html label="Groups" text="invariants of groups" %},
e. g.:

- order (called 'size' in GAP),
- conjugacy classes of elements,
- derived series,
- composition series (including identification of the composition
  factors),
- Sylow subgroups,
- certain characteristic subgroups,
- maximal subgroups,
- normal subgroups,
- subgroup lattice,
- {% include ref.html label="Tables of Marks" text="table of marks" %},
- {% include ref.html label="Groups of Automorphisms" text="automorphism group" %} (see also the package
  [AutPGrp](https://gap-packages.github.io/autpgrp/)),
- cohomology groups (packages
  [cohomolo](https://gap-packages.github.io/cohomolo) and
  [HAP](https://gap-packages.github.io/hap)
  and manual section
  {% include ref.html label="1-Cohomology" text="1-cohomology" %}),
- ordinary {% include ref.html label="Character Tables" text="character table" %} (see also the page
  [Representations and Characters of Groups](representations.html)).

There are also functions for

- {% include ref.html label="Group Homomorphisms" text="group homomorphisms" %},
- {% include ref.html label="Group Actions" text="group actions" %},
- {% include ref.html label="Group Products" text="group products" %},
  and
- [group constructions](https://gap-packages.github.io/grpconst/)
- [construction of groups of cube-free order](https://users.monash.edu.au/~heikod/cubefree.html).

Of course the range of applicability of the particular functions depends
very much on the order and structure of the group. To give an idea of
capabilities, GAP has (already in 1993) been used to find
the composition series, Sylow subgroups and character table of a certain
solvable subgroup of order 3,265,173,504 in the sporadic simple group
Fi<sub>23</sub>, given as a permutation group of degree 31,671.
