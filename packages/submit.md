---
title: Submitting a Package
layout: default_with_title
parent: GAP Packages
permalink: /packages/submit/
---

Packages distributed with GAP ship with it and are updated automatically
when you release a new version. To submit a package for distribution, write
to the GAP development mailing list or open an issue. If you are starting a
new package, [Creating a Package]({{ site.baseurl }}/packages/create/)
describes the recommended route.

A package does not have to be distributed with GAP to be used:
[PackageManager](https://github.com/gap-packages/PackageManager) installs
any package from its git repository or a release archive. We also list
packages not distributed with GAP on
[gap-packages.github.io](https://gap-packages.github.io); to add yours, tell
us about it on the list or open a pull request there.

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
team checks the requirements and replies there: we accept the package, say
what needs to change, or decline it. Meeting the requirements is not enough
on its own. We also consider whether the package is a useful addition to
GAP, and its size, since the distribution is downloaded with GAP: we look
closely at any package whose archive is larger than a few MB. A package we
decline can still be listed among the packages not distributed with GAP.

Once a package is accepted, it is added to the
[package distribution](https://github.com/gap-system/PackageDistro) and ships
with the next GAP release.

From then on, new versions are picked up automatically: we check the
`PackageInfoURL` of each package every hour, so publishing a new
`PackageInfo.g` and archive there is all a release needs. The version number
must increase with each release.

### Maintaining your package

We test distributed packages against new versions of GAP and of other
packages. When something breaks, we tell you and usually send a fix; please
review it and make a new release. If the GAP team co-maintains your package,
we can make such releases ourselves; see
[Hosting your package on GitHub]({{ site.baseurl }}/packages/create/#hosting-your-package-on-github).

We may remove a package from the distribution at any time, for example if
its maintainers do not respond to reasonable requests for releases needed to
keep it compatible with GAP and other packages, or if it changes in a major
way, such as growing much larger or adding functionality outside its
original scope. A removed package can be submitted again.

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
   [Do not change the behaviour of GAP]({{ site.baseurl }}/packages/create/#do-not-change-the-behaviour-of-gap).

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

The CI workflow that PackageMaker sets up runs your package's tests on every
change to your repository, with GAP's default packages and with only the
needed packages, and can report which parts of your code the tests exercise.
It does not run the other commands on this page. High coverage is encouraged
but not a strict requirement.

List the variables and methods your package defines (requirement 4);
{% include ref.html label="ShowPackageVariables" %} marks with `*` those
that the built manual does not document:

```sh
./gap -q -A --packagedirs DIR -c 'ShowPackageVariables("mypkg"); QuitGap();'
```
