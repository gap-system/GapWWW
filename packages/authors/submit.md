---
title: Submitting a Package
layout: default_with_title
grand_parent: GAP Packages
parent: For Authors
permalink: /packages/authors/submit/
---

Packages that meet the requirements below are distributed with GAP and
updated automatically when you release a new version. To submit one, write
to the GAP development mailing list or open an issue.

If you do not want to submit your package, we can still list it on
[gap-packages.github.io](https://gap-packages.github.io) among the packages
not distributed with GAP: tell us about it on the list, or open a pull
request there.

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
5. Submit the package as described below.

Other setups work too, as long as they meet the
[requirements](#requirements): see
[Hosting Your Package on GitHub]({{ site.baseurl }}/packages/authors/#hosting-your-package-on-github)
for what GitHub offers, and the
{% include ref.html label="Using and Developing GAP Packages" text="Reference Manual" %}
for how a package is structured.

### How to submit

Send an email to <gap@gap-system.org>, or
[open an issue](https://github.com/gap-system/PackageDistro/issues/new?template=new-package.yml)
in the PackageDistro repository, giving:

- the package name and a short description of what it does;
- the URL of its `PackageInfo.g` file;
- the URL of its source repository, if it has one;
- how it relates to existing packages or library functionality, if it
  overlaps with any.

Anyone may do this on behalf of the package authors, but only with their
consent. We forward submissions made as issues to the list.

**The list is open.** Anyone can
[subscribe](https://lists.uni-kl.de/gap/info/gap), and subscribers can read
all messages in its [archive](https://lists.uni-kl.de/gap/arc/gap). You do not need
to subscribe to submit: messages from non-members are held until a moderator
releases them, which may take a day or two.

### What happens next

Your submission is discussed on the list, where anyone can comment. The GAP
team checks the requirements and replies there, either accepting the package
or saying what needs to change. Once it is accepted, it is added to the
[package distribution](https://github.com/gap-system/PackageDistro) and ships
with the next GAP release.

From then on, new versions are picked up automatically: we check the
`PackageInfoURL` of each package every hour, so publishing a new
`PackageInfo.g` and archive there is all a release needs. The version number
must increase with each release.

### Maintaining your package

We test distributed packages against new versions of GAP and of other
packages. When something breaks, we tell you and often send a fix; please
review it and make a new release, or let us make releases for you, see
[Hosting Your Package on GitHub]({{ site.baseurl }}/packages/authors/#hosting-your-package-on-github).
If a package stays broken and we cannot reach its maintainers, we may have
to remove it from the distribution until it is fixed.

### Requirements

You do not have to check these yourself: when you submit, our automated
tests check requirements 1, 2, 6 and 7, we review the rest, and we tell you
what, if anything, needs fixing.

A package must

1. have a `PackageInfo.g` that passes
   {% include ref.html label="ValidatePackageInfo" %};
2. be downloadable: `PackageInfoURL`, `README_URL` and every archive given by
   `ArchiveURL` and `ArchiveFormats` must be reachable, and each archive must
   unpack into a single directory without symbolic links;
3. be distributed under a license compatible with GPL version 2, named in
   the `License` field and included as a file;
4. have a manual that documents all functionality meant for users, built and
   included in the archive, with examples that actually work;
5. have a non-trivial test suite, named by `TestFile`, that exercises the
   functionality of the package, including the manual examples; merely loading
   the package does not count;
6. pass its tests both with all other distributed packages loaded and with
   only the packages it needs;
7. load without errors or warnings, alone and together with all other
   distributed packages, and not change the behaviour of GAP or other
   packages; see
   [Do Not Change GAP's Behaviour]({{ site.baseurl }}/packages/authors/#do-not-change-gaps-behaviour-in-a-package).

### Getting help

If you have questions about submitting a package, or need help meeting a
requirement, ask on the list, in the [GAP Slack]({{ site.baseurl }}/slack),
in a [PackageDistro issue](https://github.com/gap-system/PackageDistro/issues),
at [GAP Days]({{ site.baseurl }}/contact/#gap-days), or ask anyone from the
GAP team you know. [Help & Community]({{ site.baseurl }}/contact/) compares
these channels.

### Checking your package locally

To find problems before you submit, you can run these checks yourself.

You need a GAP installation with all distributed packages installed and
compiled; the release archive from the
[download page]({{ site.baseurl }}/install/) has them. Put your package into
a directory, here `DIR`, and run these commands from the GAP root directory.
The first three exit with status 0 on success.

Validate `PackageInfo.g` (requirement 1):

```sh
./gap -q -c 'if ValidatePackageInfo("DIR/mypkg/PackageInfo.g") then QuitGap(0); fi; QuitGap(1);'
```

Run the tests with all packages loaded (requirements 6 and 7):

```sh
./gap -q --packagedirs DIR -c 'LoadAllPackages(); if TestPackage("mypkg") = true then QuitGap(0); fi; QuitGap(1);'
```

Run the tests with only the needed packages loaded (requirement 6):

```sh
./gap -q -A --packagedirs DIR -c 'LoadPackage("mypkg" : OnlyNeeded); if TestPackage("mypkg") = true then QuitGap(0); fi; QuitGap(1);'
```

Here `-A` stops GAP from loading its default packages, and the
`OnlyNeeded` option stops `LoadPackage` from loading your suggested packages.
A test that fails only in this mode uses a suggested package without
checking whether it is loaded; see
{% include ref.html label="Testing a GAP package" %}.

If `TestFile` is a `.g` file rather than a `.tst` file, it must exit GAP
itself with a status reporting the result, for example by calling
`TestDirectory` with the option `exitGAP := true`. The Example package's
[`tst/testall.g`](https://github.com/gap-packages/example/blob/master/tst/testall.g)
shows how.

List the variables and methods your package defines (requirement 4);
{% include ref.html label="ShowPackageVariables" %} marks with `*` those
that the built manual does not document:

```sh
./gap -q -A --packagedirs DIR -c 'ShowPackageVariables("mypkg"); QuitGap();'
```

The GitHub workflows set up by PackageMaker run these tests on every change
to your repository, and can report which parts of your code they exercise. High coverage is welcome but not required.
