---
title: For Authors
layout: default_with_title
parent: GAP Packages
has_children: true
permalink: /packages/authors/
---

If you have written or are going to write programs which enhance the
functionality of GAP in some area, you may consider
organizing and maybe distributing your code in form of a GAP
package. Here is a collection of information for package
authors or maintainers.
(You may also consult the package
[Example](https://gap-packages.github.io/example) or just look what other
package authors have done.)

### Getting Started Writing a Package

The GAP Reference Manual contains a
{% include ref.html label="Using and Developing GAP Packages" text="chapter on using and developing GAP packages" %},
which describes the rules and conventions for the structure of a GAP package,
and the GAP functions that deal with package administration.

The interface between GAP and a GAP
package consists of two or three files `PackageInfo.g`,
`init.g`, and perhaps `read.g`. The first of these contains
meta information on the package for loading and (possibly) distribution.
There are different ways to create a new package.

- You can use the tool called
  [PackageMaker](https://github.com/gap-system/PackageMaker), which
  asks several questions about the intended package, and then creates a basic
  package accordingly to the provided information. For details, please refer to
  [its documentation](https://github.com/gap-system/PackageMaker).
- Or you can copy an existing package and adjust its content by hand.
  In particular a new `PackageInfo.g` file can be created easily
  from a working one, for example from the
  [`PackageInfo.g`](https://gap-packages.github.io/example/PackageInfo.g)
  file from the [Example](https://gap-packages.github.io/example) package, which
  has detailed comments on each entry.


As the number of packages and library modules in GAP grows, it is important to
try to avoid clashes where two independently developed pieces of code use the
same global  variable names in inconsistent ways.  See the page
[Use of Global Variable Names]({{ site.baseurl }}/packages/authors/variablenames.html)
as well as the subsection
{% include ref.html label="Functions and Variables and Choices of Their Names" text="Functions and Variables and Choices of Their Names" %}
of the GAP Reference Manual
for advice how to avoid such 'name clashes'.

### Do Not Change GAP's Behaviour in a Package

It is generally a bad idea for a package to change the behaviour of
the core functionality of GAP, as opposed to extending it,
or implementing better algorithms to compute the same results. For instance,
if you believe that you can improve the way some kind of GAP
object is printed, then please suggest this improvement by an email to
<support@gap-system.org> (by all means
include your code), rather than simply implementing it in your package.

There are two reasons for this. Firstly, it can surprise users who may not
even know they are using your package (perhaps some other package loaded it).
Secondly, we have a variety of tools for testing GAP releases
and they work much better if the output produced by "standard"
GAP commands is the same with and without packages.

For similar reasons, we would also ask that packages refrain from assigning
names to indeterminates, or otherwise changing the appearance of common
objects.

### Making Your Package Available to Other GAP Users

Once a package works and has documentation of its functionality, you
should consider to distribute it for interested GAP
users. Of course, you can just do it on your own, say via a web page.
In this case we would like to hear about the availability of the
package, please write a hint to <support@gap-system.org>.

Another possibility is to redistribute your package via the website
of GAP itself. If you want that, also contact us as
just stated. The GAP Group will check if your package
provides some new or improved functionality which looks interesting for
other users, if it contains  reasonable documentation, and if it seems
to work smoothly with the GAP library and other
distributed packages. In this case the package can take part in the
distribution update mechanism described below. It becomes a
<em>deposited</em> package.

### Writing Documentation for Your Package

An  essential feature  of any GAP package is  that it
should   have   documentation  which   works   smoothly  with
GAP's on-line  help. There  are a number  of possible
ways of achieving this.

Firstly, and the way we recommend, you can use the
[GAPDoc](http://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc) package
which allows you to write documentation in a concise and well-specified
XML-like language. This documentation can then be processed using GAPDoc to
produce on-line help, printed manuals, and web pages.
(To get machine independent cross-links in your documentation, copy
your package in the standard location `pkg/<pkgname>`
and use {% include ref.html book="GAPDoc" label="MakeGAPDocDoc" %}
with `../../..` as 5th argument.)

Alternatively, you can use the "traditional" GAP4 manual format, i.e. TeX
with some additional macros, which, provided you use it carefully, can be
processed directly by GAP as on-line help, processed
by TeX for printing and processed by a perl script
to make HTML. This format is partly
documented in the document "The gapmacro.tex Manual Format"
which is included in the
`doc` directory of the GAP installation,
and the perl script is included in the
`etc` directory of the GAP installation.
(Here, also copy your package in the standard location
`pkg/<pkgname>` when building the HTML
version of your manual to get cross-links right.)

Finally, you can develop your own solution, complying with the interfaces
described in chapter
{% include ref.html label="Interface to the GAP Help System" text="Interface to the GAP Help System" %}
of the GAP Reference Manual. There are
certain technical issues with this approach, and we would advise you to
contact us if you are considering it.

### Choosing a License for the Distribution of Your Package

We would advise all package authors to make clear in the documentation of
their package the basis on which it is being distributed to users.
Technically, this is the terms of the license which you give the users to
copy, modify and redistribute
your software (of which you presumably own the copyright) for their purposes.
GAP itself is distributed under the GNU General Public License version 2, a popular
"free software" license which allows users to redistribute it freely under the
same terms, and requires that any software which incorporates GAP
(technically, any "derived work") also be distributed under those terms. We
would encourage you to consider the GPL for your packages, but you might wish
to be more restrictive (for instance forbidding redistribution for profit) or
less restrictive (allowing your software to be incorporated into commercial
software).

Further advice could be found, for example, at [choosealicense.com](http://choosealicense.com/).

### The Package Update Mechanism

#### Setup for Distribution

What you have to do to take part in the update mechanism is
also explained in the `PackageInfo.g` file mentioned above:

- Set up a Web page for your package. There are no conditions how this
  has to look like. You may take an existing such page (like [this](http://www.math.rwth-aachen.de/~Frank.Luebeck/EDIM)) and
  adjust it for your package.
- Produce an archive of your package in (at least) one of the formats
  .tar.gz, .tar.bz2 or .zip.
- Make this archive and as separate files the `README`
  (containing installation instructions) and the `PackageInfo.g`
  file accessible by copying them to your website. (Your
  `PackageInfo.g`  contains the URLs of these files.)
- Send the URL of your `PackageInfo.g` file to <support@gap-system.org>.

#### Updating a Package Distributed with GAP

Once your package is in the update system, you can  publish
updates as follows:

- Create a new archive. Note that you **must** change the
  version number of your package. Don't forget to adjust the PackageInfo.g
  file and maybe other files to the new version number (the new number must be
  higher, as explained {% include ref.html label="Version Numbers" text="here" %}). Also the
  name of the archive file must be different from previous names.
  (Just choose a name
  which contains the package name and the version number, like
  `example-1.3.tar.gz`.)
- Copy the new archive  and `README` to the URLs given in your
  `PackageInfo.g` file.
- Copy the new `PackageInfo.g` file to the URL given in the
  previous `PackageInfo.g` file (this is where the update
  mechanism looks for new versions.)
- Our servers will usually pick up the update within an hour and
  initiate the update process by creating a pull request on the
  [package distribution git repository](https://github.com/gap-system/PackageDistro/).
  If you want to track your package submission, you can do so there.
- After the next update of the GAP distribution, check if the new version of
  your package is included there and also listed on the GAP website.
- We advise package authors to maintain an update "history",
  which documents the changes from one version to another.
  A good example is contained in the
  [README](https://github.com/gap-packages/grape/blob/master/CHANGES.md)
  file of the DESIGN package of Leonard Soicher.


You may also wish to refer to the
{% include ref.html label="Package release checklists" text="package release checklists" %}
in the GAP Reference Manual.

### Validating a `PackageInfo.g` File

Each GAP package must contain a file
`PackageInfo.g` in which meta information is collected, such as
package name, version, authors/maintainers with contact addresses, location
of download archive(s), infos on provided manuals, ...
This is used for loading the package into GAP and for a possible
redistribution of the package via the GAP website.

A basic check for such a file from within GAP is provided by the function
{% include ref.html label="ValidatePackageInfo" %}.
