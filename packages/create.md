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
- Create internal global variables only if you need them. A helper used in
  one place can be a local variable of the function that uses it. Give
  helpers used in several places a name that starts with the package name,
  or collect them in one record, as the GAP library does with `FFECONWAY`.
  Such a record also shows that its contents are internal, and
  `ShowPackageVariables` lists only the record.
- Leave names that start with a lowercase letter, and very short names such
  as `C1`, to users.
- Avoid names of the form `SetXXX` and `HasXXX`: attributes and properties
  use them for their setters and testers.
- For documented functions with short or common names, such as `Tail` or
  `NormalForm`, prefer operations (or attributes or properties) to global
  functions, even with only one method, so that other packages can install
  methods for unrelated purposes. A global function is the right choice if
  it takes a variable number of arguments, like `Print`, or if its arguments
  are plain lists or records, which method selection cannot tell apart from
  others.

`ShowPackageVariables` lists the global variables your package defines. The
Reference Manual section
{% include ref.html label="Functions and Variables and Choices of Their Names" text="Functions and Variables and Choices of Their Names" %}
has more detail.

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

### Documentation

Write the manual with
[GAPDoc](https://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc/), the
format of GAP's own manuals, or with
[AutoDoc](https://github.com/gap-packages/AutoDoc), which generates GAPDoc
from comments next to your code; PackageMaker sets up AutoDoc. Either way,
GAP's help system shows the manual, and it is built as text, HTML and PDF.
See
{% include ref.html label="Writing Documentation and Tools Needed" %}.

### Testing

Name a test file in the `TestFile` component of `PackageInfo.g`. It should
exercise the functionality of the package, including the examples in its
manual, and pass both with all other packages loaded and with only the
packages yours needs. Keep it to a few minutes: the package distribution
stops each test run after 10 minutes and counts it as failed, so longer
tests belong in files that the `TestFile` does not run. PackageMaker
creates a `tst/testall.g` that runs all test files in `tst`, and a workflow
that runs it on every change. See
{% include ref.html label="Testing a GAP package" %} and the commands in
[Checking your package locally]({{ site.baseurl }}/packages/submit/#checking-your-package-locally).

### Releasing

The Release workflow from the recommended route builds the archive,
publishes it and updates the package website. Without it, publish the
archive, the `README` and the `PackageInfo.g` at the URLs given in
`PackageInfo.g`. Either way, the version number must increase with each
release; see {% include ref.html label="Version Numbers" %},
{% include ref.html label="Releasing a GAP Package" %} and the
{% include ref.html label="Package release checklists" text="release checklists" %}.

### Choosing a license

We encourage the GNU General Public License, version 2 or later, under which
GAP itself is distributed. A package distributed with GAP must have a
license compatible with version 2 of the GPL. Include the license text in a
`LICENSE` file and give its [SPDX identifier](https://spdx.org/licenses/) in
the `License` component of `PackageInfo.g`; see
{% include ref.html label="Selecting a license for a GAP Package" %}.

### Getting help

Ask on the
[GAP development list]({{ site.baseurl }}/forum/#gap-development-list) or
in the [GAP Slack]({{ site.baseurl }}/slack);
[Help & Community]({{ site.baseurl }}/contact/) lists all channels.
