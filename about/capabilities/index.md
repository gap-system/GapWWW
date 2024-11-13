---
title: Capabilities
parent: About
layout: default_with_title
has_children: true
permalink: /capabilities/
---

### GAP provides:

- [Mathematical capabilities](#mathematical-capabilities) accessible through
  - a large library of
      {% include ref.html label="Functions" text="functions" %}, containing
      implementations of various algebraic algorithms.
  - separate [packages]({{ site.baseurl }}/packages/) of additional
      functions for specialized purposes which can be used like library
      functions,
  - data libraries containing large classes of various algebraic objects that are accessible by
      using GAP commands.
- A {% include ref.html label="The Programming Language" text="programming language" %},
  also called GAP,
  which is interpreted and can be compiled. It can be used interactively
  at the keyboard or to write programs to be saved and then executed.
  Such programs can easily be modified and rerun. The language features:
  - Pascal-like control structures,
  - automatic memory management including garbage collection,
  - {% include ref.html label="Streams" text="streams" %},
  - flexible
      {% include ref.html label="Lists" text="list" %} and
      {% include ref.html label="Records" text="record" %} data types,
  - built-in data types for key algebraic objects,
  - automatic {% include ref.html label="Method Selection" text="method selection" %}
      building on  a mechanism for
      automatically  choosing the highest ranked method for a certain
      operation,  depending on the current state of all its arguments,
      so that GAP objects representing mathematical objects may gain
      knowledge about themselves during their lifetime  resulting in
      better methods being chosen later on.
- An {% include ref.html label="Main Loop and Break Loop" text="interactive environment" %}
  that supports in particular
  - {% include ref.html label="Line Editing" text="line editing" %}
      e.g. tab completion,
  - {% include ref.html label="Break Loops" text="break loops" %}
      for debugging,
  - further {% include ref.html label="Debugging and Profiling Facilities" text="debugging and profiling" %}
      facilities for GAP programs,
  - {% include ref.html label="The Help System" text="online help" %}
    (i.e. online access to the manuals).


<h3 id="mathematical-capabilities">Mathematical Capabilities</h3>

We do not distinguish here between
the capabilities of the main GAP library, the packages,
and the data libraries.
  - [Basic Capabilities](basic.html),
  - [Groups and Group Elements](groups.html),
  - [Permutation and Matrix Groups](permgroups.html),
  - [Finitely Presented Groups](fpgroups.html),
  - [Polycyclic Groups](polycyclic.html),
  - [Representations and Characters of Groups](representations.html),
  - [Vector Spaces, Modules, and Algebras](algebras.html),
  - [Graphs, Codes, and Designs](graphs.html),
  - [Semigroups, Monoids, and Other Generalisations of Groups](semigroups.html),
  - [Words, Rewriting, and Automata](words.html),
  - [Further Capabilities](further.html),
  - [Links to Other Systems](links.html).
