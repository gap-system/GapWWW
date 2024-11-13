---
title: Representations
grand_parent: About
parent: Capabilities
layout: default
nav_order: 7
permalink: /capabilities/representations
---
## Representations and Characters of Groups

Group representations over fields of characteristic zero are mainly
investigated via their characters. GAP provides methods
for computing the irreducible characters of a given finite group, either
{% include ref.html label="The Dixon-Schneider Algorithm" text="automatically" %} or
{% include ref.html label="Class Functions" text="interactively" %}
by character theoretic means. It also provides many functions for
deducing group theoretic properties from
{% include ref.html label="Character Tables" text="character tables" %}.

The computation of the irreducible representations themselves is possible
for not too large groups (see e. g. the function 'IrreducibleRepresentations'
in the reference manual section
{% include ref.html label="Computing the Irreducible Characters of a Group" text="Computing the Irreducible Characters of a Group" %}).
The package
[Repsn](https://gap-packages.github.io/repsn/) provides methods for the
construction of characteristic zero representations of finite groups.

Modular representations (i. e., over fields whose characteristic divides
the group order) can be studied via Brauer characters or by explicit
calculations with matrices representing the generators of the group in
question, using
{% include ref.html label="The MeatAxe" text="MeatAxe" %} methods, and
[condensation techniques](http://www.math.rwth-aachen.de/~Juergen.Mueller/preprints/jm102.pdf).

Several GAP data libraries are related to representations
and characters.

- The GAP
  [Character Table Library](https://www.math.rwth-aachen.de/~Thomas.Breuer/ctbllib)
  gives access to ordinary and modular character tables of many nearly
  simple groups and of related groups such as their maximal subgroups.
- The [Atlas of Group Representations](https://www.math.rwth-aachen.de/~Thomas.Breuer/atlasrep) gives access to
  many permutation and matrix representations of many nearly simple
  and related groups.

<!--
- The GAP Library of [Tables of Marks]({{ site.baseurl }}/Datalib/tom.html)
  provides these for many nearly simple and related groups.
-->
