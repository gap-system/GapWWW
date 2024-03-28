---
title: Basic
grand_parent: About
parent: Capabilities
layout: default
nav_order: 2
permalink: /capabilities/basic
---
## Basic Capabilities

GAP provides many ways of forming ...

 - {% include ref.html label="Lists" text="lists" %} (mutable and 
   [immutable]({{ site.baseurl }}/faq/#immutable)), which also covers
   {%- include ref.html label="Sorted Lists and Sets" text="sets" %},
   {%- include ref.html label="Row Vectors" text="row vectors" %},
   {%- include ref.html label="Matrices" text="matrices" %},
   {%- include ref.html label="Strings and Characters" text="strings" %}, and
   {%- include ref.html label="Boolean Lists" text="Boolean lists" %},
 - {% include ref.html label="Records" text="records" %},
 - {% include ref.html label="Domains and their Elements" text="domains" %},
    i. e., objects representing sets with an algebraic structure.

Notions and tools modeled in some analogy to elementary set theory help
to handle these:

- distinction of
  {%- include ref.html label="Objects and Elements" text="objects and elements" %},
- {% include ref.html label="Booleans" text="Booleans" %},
- {% include ref.html label="Orderings" text="orderings" %},
- {% include ref.html label="Mappings" text="mappings" %} (in particular
  mappings respecting structures which again can be elements of
  structures),
- {% include ref.html label="Relations" text="relations" %}.

GAP can compute with

- arbitrary {% include ref.html label="Integers" text="integers" %},
- {% include ref.html label="Rational Numbers" text="rational numbers" %},
- {% include ref.html label="Cyclotomic Numbers" text="cyclotomic numbers" %}, in particular
  {%- include ref.html label="Gaussians" text="Gaussian numbers" %},
- elements of {%- include ref.html label="Finite Fields" text="finite fields" %} (see also the coding theory package
  [GUAVA](https://gap-packages.github.io/guava/)),
- {% include ref.html label="p-adic Numbers (preliminary)" text="<em>p</em>-adic numbers" %},
- {% include ref.html label="Polynomials and Rational Functions" text="polynomials" %}, including
  {%- include ref.html label="Multivariate Polynomials" text="multivariate polynomials" %} (GAP contains
  only a basic implementation of Buchberger's algorithm for computing
  {%- include ref.html label="Groebner Bases" text="Gröbner bases" %},
  for more serious computations the package
  [singular](https://gap-packages.github.io/singular/) provides an interface
  to the extensive capabilities of the system
  [SINGULAR](http://www.singular.uni-kl.de)),
- {% include ref.html label="Rational Function Families" text="rational functions" %} as well as
- various kinds of [group elements](groups.html), e. g.
  {%- include ref.html label="Permutations" text="permutations" %},
  {%- include ref.html label="Matrices" text="matrices" %}, and
  {%- include ref.html label="Words" text="abstract words" %}.

One can work with many algebracic structures. In addition to those listed under
[Mathematical Capabilities]({{ site.baseurl }}/About/overview.html#mathematical-capabilities), there are e. g.

- {% include ref.html label="Finite Fields" text="finite fields" %},
- {% include ref.html label="Residue Class Rings" text="residue class rings" %} of integers (see also the package
  [ResClasses](https://gap-packages.github.io/resclasses/)),
- {% include ref.html label="Abelian Number Fields" text="abelian number fields" %},
- {% include ref.html label="Integral matrices and lattices" text="lattices and integral matrices" %}.

Also there are

- various {%- include ref.html label="Combinatorics" text="combinatorial functions" %},
- functions for
  {%- include ref.html label="Number Theory" text="elementary number theory" %} as well as
- functions for
  {%- include ref.html label="Prime Integers and Factorization" text="prime number factorization" %} (see also the package
  [FactInt](https://gap-packages.github.io/FactInt)).
