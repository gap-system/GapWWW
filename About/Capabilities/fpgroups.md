---
title: Fp Groups
grand_parent: About
parent: Capabilities
layout: default
nav_order: 5
permalink: /capabilities/fpgroups
---
## Finitely Presented Groups

It follows from the well known theorems on the algorithmic unsolvability
of the word problem and related problems that there are no deterministic
methods to answer most questions about the structure of finitely
presented groups. For these essentially two approaches are possible:
On one hand trial-and-error methods such as the Todd-Coxeter and
Knuth-Bendix methods, on the other hand methods to find certain factor
groups of described structure, most of which are based on the idea of
'collection'. For theoretical background of the implemented methods see
the book "Computation with finitely presented groups" of Charles Sims.

The main GAP library provides methods for handling
{%- include ref.html label="Finitely Presented Groups" text="finitely presented groups" %} such as
- Todd-Coxeter,
- Reidemeister-Schreier,
- Low Index Subgroups, as well as
- certain quotient methods.

Also there are functions to handle
{%- include ref.html label="Presentations and Tietze Transformations" text="Tietze transformations" %}.

In addition there are packages 

- [FGA](http://www.icm.tu-bs.de/ag_algebra/software/FGA/) providing algorithms for
  free groups,
- [ACE](https://gap-packages.github.io/ace) linking to a particular
  powerful implementation of the Todd-Coxeter method,
- [ITC](https://gap-packages.github.io/itc/) providing an interactive
  Todd-Coxeter mainly for teaching and learning,
- [ANUPQ](https://gap-packages.github.io/anupq/) for finding
  p-quotients, standard presentations, and descendants,
- [NQ](https://gap-packages.github.io/nq/) for finding infinite
  nilpotent quotients, and
- [KBMAG](https://gap-packages.github.io/kbmag) with Knuth-Bendix
  and automatic groups methods. 
