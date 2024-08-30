---
title: Variable Names
layout: default_with_title
grand_parent: GAP Packages
parent: For Authors
permalink: /packages/authors/variablenames/
---

As the number of packages and library modules in GAP grows,
it is important to
try to avoid clashes where two independently developed pieces of code use the
same global  variable names in inconsistent ways.  Note that "global variable
names" include all names in the global namespace, not just those created with
`DeclareGlobalVariable`. We therefore recommend the following
guidelines for authors:

Firstly, new global variables should be introduced with one of the
`Declare...` functions such as `DeclareAttribute` or
`DeclareGlobalVariable`, or, if this not
suitable for some reason, set using `BindGlobal` rather than simple
assignment. (See section
{%- include ref.html label="Global Variables in the Library" text="Global Variables in the Library" %}
of the GAP Reference Manual for more
information on these function)<br/>
This will help ensure that any clashes cause error messages rather than wrong
results.

After this, it is important to distinguish between documented names and
undocumented names. Documented names are those that appear in the reference
manual or the manual of the package that defines them, or which are, perhaps,
intended to do so in the future. Undocumented names are all other global
variables created by a module or package.

Concerning undocumented names, the first rule is not to create them
unless you need them. For instance the common pattern

```gap
workerFunction := function(a,b,c,d)
        ......
end;

InstallMethod( DocumentedFunction, ......,
    function( ....)


    # supply missing argyments, handle special cases
    # do setup

    workerFunction(x,y,z,q);

    # clean up
    #
end);
```
is much better implemented as
```gap
InstallMethod( DocumentedFunction, ......,
    function( ....)
    local workerFunction,....;
    workerFunction := function(a,b,c,d)
       ......
    end;


    # supply missing argyments, handle special cases
    # do setup

    workerFunction(x,y,z,q);

    # clean up
    #
end);
```
unless the same `workerFunction` is used in two or more places.

Next, all undocumented names from  a module or package should be chosen so
that they are not reasonably going to occur in any other module or package.
A simple way to achieve this is to prepend the module or package name. So:

```gap
BindGlobal("MyPackageWorkerFunctionUsedInTwoPlaces", ....);
```
or
```gap
MY_PACKAGE := rec();

MY_PACKAGE.WorkerFunctionUsedInTwoPlaces := .....;
```

As an example of this latter approach see the new file
`ffeconway.gi` in the
library, which store many internal functions and some data in a record
called `FFECONWAY`.

Moving on to the documented names, the main rule here is that functions
with "short" or "common" names, such as "Tail" or "NormalForm" should
usually be Operations (or Attributes or Properties if appropriate). See
chapter
{%- include ref.html book="Tutorial" label="Operations and Methods" %}
of the GAP tutorial and chapter
{%- include ref.html label="Creating New Objects" %}
of the GAP Reference Manual for more detail of these concepts. Even if you
only plan one method, or you only plan to apply them to non-attribute storing
objects, declaring them as Properties, Attributes or Operations will allow
them to be used for unrelated purposes in other modules or packages, since
GAP allows multiple declarations quite flexibly. Although see section
{%- include ref.html label="Operations and Mathematical Terms" %}
of the GAP Reference Manual for a discussion of the risks of overusing
names.

There are only two real reasons for declaring something as a GlobalFunction
rather than an Operation. One  is that you plan to have a single method
which takes a variable number of arguments (for instance `Print`
and `Concatenation` cannot be Operations).  The other is that
your package represents mathematical
constructs by simple GAP objects such as plain lists
or records, so that
method selection could not sensibly recognise your objects. In these
cases you should use a name that is not likely to clash with other
packages or library developments.

If you have concerns about what is, or isn't appropriate practice in a
package you are developing, feel free to contact GAP support
at any stage for help and advice.
