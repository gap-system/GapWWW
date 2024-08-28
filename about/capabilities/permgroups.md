---
title: Perm Groups
grand_parent: About
parent: Capabilities
layout: default
nav_order: 4
permalink: /capabilities/permgroups
---
## Permutation and Matrix Groups

For an overview of computational methods for permutation groups see
for example the book "Permutation Group Algorithms" of
Ákos Seress. Historically, these methods
started with Charles Sims' method for finding the order and a stabilizer
chain nowadays known as the Schreier-Sims method, which is the basis of
many functions implemented in GAP. To give a small sample
of further special methods:
The nearly linear time methods for permutation groups include functions
to compute

- a stabilizer chain,
- p-core,
- radical,
- centre,
- composition series.

There are also tasks for which no polynomial time methods are known and
for which GAP relies on partition backtrack methods, for
example

- centralizer,
- normalizer, or
- intersection of subgroups.

The GAP4 package [RCWA](https://gap-packages.github.io/rcwa/)
provides   methods  for  computations   with  the   so-called  Residue
Class-Wise  Affine   mappings  of  certain  euclidian   rings  R  into
themselves  and the  groups generated  by bijective  mappings  of this
type.  The latter mappings form a proper subgroup of Sym(R).

For {%- include ref.html label="Matrix Groups" text="matrix groups" %}
there are also special methods in the GAP library
and a private GAP4 package 
[matrixss](http://matrixss.sourceforge.net) 
implements  a
[Schreier-Sims algorithm for matrix groups](http://henrik.baarnhielm.net/schreiersims.pdf),
including both the standard deterministic and the standard
probabilistic approach.

The package
[Polenta](https://gap-packages.github.io/polenta/) allows to find
{%- include ref.html label="Pc Groups" text="polycyclic presentations" %}
for matrix groups.
