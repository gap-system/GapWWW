---
title: Creating a Package
layout: default_with_title
parent: GAP Packages
permalink: /packages/create/
---

A GAP package bundles your code with its manual, which then appears in
GAP's help system, so that others can install it and load it with
`LoadPackage`. This page describes how to create one. How packages work,
from their files and `PackageInfo.g` to loading and dependencies, is
described in the
{% include ref.html label="Using and Developing GAP Packages" text="chapter on packages" %}
of the Reference Manual.

### Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

### The recommended route

This route sets up testing, releases and a package website for you:

1. Create your package with
   [PackageMaker](https://github.com/gap-packages/PackageMaker), and let it
   set up a git repository and the GitHub workflows.
2. Publish the repository on GitHub. The workflows then run your tests and
   build your manual on every change.
3. Write your code, its manual and its tests.
4. Make a release with the Release workflow, as described in
   [release-pkg](https://github.com/gap-actions/release-pkg#usage). It
   publishes the archive and updates your package's website, which also
   serves your `PackageInfo.g`.
5. [Submit]({{ site.baseurl }}/packages/submit/) the package for
   distribution with GAP, or have it listed under
   [Undistributed Packages]({{ site.baseurl }}/packages/undistributed/).

Other setups work too; a package distributed with GAP must meet the
[requirements]({{ site.baseurl }}/packages/submit/#requirements). To set up
a package by hand, start from a copy of the
[Example](https://github.com/gap-packages/example) package, whose
`PackageInfo.g` explains each entry.

### Hosting your package on GitHub

You can host your package anywhere, but on GitHub you can use tools the GAP
team maintains:

- the actions in [gap-actions](https://github.com/gap-actions) run your
  tests on every change, as set up in the
  [Example](https://github.com/gap-packages/example) package, so you learn
  at once when a change breaks something, and not later from your users;
- [release-pkg](https://github.com/gap-actions/release-pkg) makes a release
  and updates your package's website on GitHub Pages;
- others can contribute changes and be added as maintainers, so the package
  does not depend on a single person.

In addition, you can move your package into the
[gap-packages](https://github.com/gap-packages) organisation, and out again,
at any time. There you can also allow the GAP team, or some of its members,
to co-maintain it: we then take care of routine maintenance such as small
fixes and new releases, so the package stays available if you no longer have
time for it. We do not take over a package without its authors' consent.
To move your package or set this up, ask on <gap@gap-system.org>.

### Names of functions and variables

The GAP library, all packages and the user share one global namespace. To
avoid clashes:

- Define global variables with `BindGlobal` or a `Declare...` function such
  as `DeclareGlobalFunction` or `DeclareOperation`, not by plain assignment.
  A clash then raises an error instead of silently overwriting a value.
- Give global variables names that are unlikely to clash, for example by
  starting them with the name of the package. Operations do not need this:
  several packages can install methods for the same operation.
- Create internal global variables only if you need them. A helper used in
  one place can be a local variable of the function that uses it. Give
  helpers used in several places a name that starts with the package name,
  or collect them in one record, as the GAP library does with `FFECONWAY`.
  Such a record also shows that its contents are internal, and
  `ShowPackageVariables` lists only the record.
- Leave names that start with a lowercase letter to users. Names such as
  `cs`, `exp` or `pow` are fine for local variables but must never be
  global. Avoid very short names such as `C1` or `ORB` for writable global
  variables too: a user overwrites them easily.
- Avoid names of the form `SetXXX` and `HasXXX`: attributes and properties
  use them for their setters and testers.
- For documented functions with short or common names, such as `Tail` or
  `NormalForm`, prefer operations (or attributes or properties) to global
  functions, even with only one method, so that other packages can install
  methods for unrelated purposes. A global function is the right choice if
  it takes a variable number of arguments, like `Print`, or if its arguments
  are plain lists or records, which method selection cannot tell apart from
  others.
- Follow the
  {% include ref.html label="Naming Conventions" text="naming conventions" %}
  of GAP, so that users can guess the names of your functions.
- Put declarations (`Declare...`) into `.gd` files read from `init.g`, and
  implementations (`Install...`) into `.gi` files read from `read.g`. GAP
  reads `init.g` before `read.g`, so the implementations can then be in any
  order; see
  {% include ref.html label="Declaration and Implementation Part of a Package" %}.

To see which global variables your package defines, call
`ShowPackageVariables("mypkg")` before loading it. Alternatively, start GAP
with `gap -r -A`, load the package and call
{% include ref.html label="NamesUserGVars" %}`()`. Look for variables left
over from loading, such as temporary variables with simple names: they
silently overwrite a user's variable of the same name, or are overwritten by
it.

### Do not change the behaviour of GAP

A package should extend GAP, or compute the same results with better
algorithms, but not change the behaviour of existing GAP functionality. For
example, if you think that some kind of GAP object should be printed
differently, propose this change for
[GAP itself](https://github.com/gap-system/gap/blob/master/CONTRIBUTING.md)
instead of making it in your package.

Otherwise users meet changes they did not ask for, perhaps because another
package loaded yours. Also, the GAP test suite and the tests of other
packages expect standard GAP commands to produce the same output with and
without your package loaded. For the same reason, a package should not
assign names to indeterminates or otherwise change how common objects are
displayed.

### Info classes and messages

Declare an info class for your package, for example with
`DeclareInfoClass("InfoMyPkg")`, and report progress and debugging
information with `Info(InfoMyPkg, level, ...)`. Users then choose with
`SetInfoLevel` how much of it they see; see
{% include ref.html label="Info Functions" %}.

Do not print anything while the package loads. Report problems, such as a
program that was not compiled, with
{% include ref.html label="LogPackageLoadingMessage" %}; users read these
messages with {% include ref.html label="DisplayPackageLoadingLog" %}.

### Documentation

A package needs a manual that explains how to use it, and a `README` with a
short description of the package and instructions for installing it.

Write the manual with
[GAPDoc](https://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc/), the
format of GAP's own manuals, or with
[AutoDoc](https://github.com/gap-packages/AutoDoc), which generates GAPDoc
from comments next to your code; PackageMaker sets up AutoDoc. Either way,
GAP's help system shows the manual, and it is built as text for the
terminal, as HTML, optionally with MathJax, and as PDF, which needs
`pdflatex`. The older TeX-based `gapmacro` format still works, but do not
use it for a new package.

Both tools let you keep the documentation of a function next to its code.
With GAPDoc, you write

```gap
##  <#GAPDoc Label="ListDirectory">
##  <ManSection>
##  <Func Name="ListDirectory" Arg="[dir]"/>
##
##  <Description>
##  lists the files in directory <A>dir</A> (a string)
##  or the current directory if called with no arguments.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "ListDirectory" );
```

and include it into the manual with `<#Include Label="ListDirectory">`. With
AutoDoc, the same reads

```gap
#! @Arguments [dir]
#! @Description
#!  lists the files in directory <A>dir</A> (a string)
#!  or the current directory if called with no arguments.
DeclareGlobalFunction( "ListDirectory" );
```

### Testing

Name a test file in the `TestFile` component of `PackageInfo.g`. It should
exercise the functionality of the package, including the examples in its
manual, and pass both with all other packages loaded and with only the
packages yours needs. Keep it to a few minutes: the package distribution
stops each test run after 10 minutes and counts it as failed, so longer
tests belong in files that the `TestFile` does not run. PackageMaker
creates a `tst/testall.g` that runs all test files in `tst`, and a workflow
that runs it on every change. See
{% include ref.html label="Testing a GAP package" %} for what a test file
must look like.

A package must also load cleanly and leave GAP and other packages working.
We check this for every package we distribute and tell you what we find, but
you can check it yourself:

- Load the package in a GAP started with `gap -r -A`, that is without your
  own settings and without the default packages, and in a GAP started
  normally; each time once with `LoadPackage("mypkg")` and once with
  `LoadPackage("mypkg" : OnlyNeeded)`, which leaves out the packages yours
  only suggests.
- Load it together with all other packages, with
  {% include ref.html label="LoadAllPackages" %}`()`, also with the option
  `reversed`. This finds problems that only show with certain other
  packages loaded.
- Run GAP's own tests with your package loaded: in a new GAP session, load
  the package and call
  `Read( Filename( DirectoriesLibrary( "tst" ), "testinstall.g" ) );`, which
  takes about a minute. `teststandard.g` is more thorough and takes 10 to
  20 minutes.
- Start GAP with `gap -A -O` and load the package, to see whether it uses
  {% include ref.html label="Replaced and Removed Command Names" text="obsolete names" %}.

[Checking your package locally]({{ site.baseurl }}/packages/submit/#checking-your-package-locally)
has ready-made commands for the tests we run on every submission.

### Releasing

The Release workflow from the recommended route does the following for you.
Without it:

1. Set `Version` and `Date` in `PackageInfo.g`. Every release needs a new,
   larger version number, even after a tiny change: two different archives
   must never have the same version, and the package distribution only
   picks up a release with a new version; see
   {% include ref.html label="Version Numbers" %}. Prefer
   [semantic versioning](https://semver.org/) to dates: the step from 4.5.1
   to 4.5.2 tells users more than the step from 2011.04.15 to 2011.09.14.
2. Build the manual. The archive must contain the built manual in all its
   formats, so that users need not build it themselves.
3. Create an archive in `.tar.gz`, `.tar.bz2` or `.zip` format, named
   `mypkg-1.2.3.tar.gz` and so on, with the package name in lowercase. It
   must unpack into a single directory, by custom `mypkg-1.2.3`, and
   contain everything the package needs to work, but no hidden files such
   as `.git` or `.gitignore`. Text files in a `.zip` archive should have
   UNIX line breaks.
4. Publish the archive, the `README` and the new `PackageInfo.g` at the
   URLs that `PackageInfo.g` gives as `ArchiveURL`, `README_URL` and
   `PackageInfoURL`. For a package distributed with GAP, the new
   `PackageInfo.g` at the `PackageInfoURL` of the previous version is what
   triggers the update: we check that URL every hour.

These URLs usually belong to a homepage of the package, which also gives
some basic information about it. Maintaining that page is up to you; the
Release workflow does it on GitHub. Record what changed between versions in
a `CHANGES` file.

Do not rely on the timestamps of the files in your package: they change when
it is repackaged for the GAP distribution.

If you prefer to make releases from your own computer,
[ReleaseTools](https://github.com/gap-system/ReleaseTools) and
[GitHubPagesForGAP](https://github.com/gap-system/GitHubPagesForGAP)
automate the steps above for a package hosted on GitHub.

### Choosing a license

Name the license in the manual of the package, include its text in a
`LICENSE` file, and give its [SPDX identifier](https://spdx.org/licenses/),
for example `"GPL-2.0-or-later"`, in the `License` component of
`PackageInfo.g`.

We encourage the GNU General Public License, version 2 or later, under which
GAP itself is distributed. Permissive licenses such as MIT or BSD, which
also allow your code to be incorporated into commercial software, are
possible too. A package distributed with GAP must have a license compatible
with version 2 of the GPL. [choosealicense.com](https://choosealicense.com/)
helps with choosing.

Older packages often only say that they "adopt the copyright regulations of
GAP". Be explicit instead, for example:

> *mypkg* is free software; you can redistribute it and/or modify it under
> the terms of the
> [GNU General Public License](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)
> as published by the Free Software Foundation; either version 2 of the
> License, or (at your option) any later version.

### Checklists

#### Before the first release

- Tests: the package does not break GAP's `testinstall.g` and
  `teststandard.g` or slow them down noticeably, loads in the
  configurations listed under [Testing](#testing), and follows the advice
  on [names](#names-of-functions-and-variables).
- `PackageInfo.g`: gives the correct version, release date and authors,
  passes {% include ref.html label="ValidatePackageInfo" %}, and has the
  optional components that apply, such as the URLs of the source repository
  and the issue tracker; see
  {% include ref.html label="The PackageInfo.g File" %}.
- Manual: is built and included in the archive together with its source,
  gives the same version, release date and authors as `PackageInfo.g`, can
  be searched with GAP's help system in all its formats, and names the
  license and refers to the `LICENSE` file.
- Archive: all files and directories have sensible permissions after
  unpacking (755 for directories and executables, 644 for other files), and
  there are no hidden files that do not belong to the package.
- Availability: the archive, the `PackageInfo.g` and the `README` are
  online.

#### Before the next major release of GAP

GAP makes changes that can break packages only in major releases, and
provides a beta version beforehand so that package authors can check their
packages:

- The package works as expected, its tests pass, and the examples in its
  manual match the new version of GAP.
- The needed and suggested packages in `PackageInfo.g` are still right.
- The package still states its license and includes a `LICENSE` file.
- The manual is rebuilt, which updates its cross-references to the GAP
  manuals and to the manuals of other packages.
- The package does not use obsolete names: start GAP with `-O` and load it.
- The release notes of the beta may have further advice for package
  authors.

### Getting help

Ask on the
[GAP development list]({{ site.baseurl }}/forum/#gap-development-list) or
in the [GAP Slack]({{ site.baseurl }}/slack);
[Help & Community]({{ site.baseurl }}/contact/) lists all channels.
