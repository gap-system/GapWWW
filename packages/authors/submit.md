---
title: Submitting a Package
layout: default_with_title
grand_parent: GAP Packages
parent: For Authors
permalink: /packages/authors/submit/
---

Packages that meet the requirements below are distributed with GAP and
updated automatically when you release a new version. To submit one, write
to the GAP development mailing list.

### How to submit

Send an email to <gap@gap-system.org> containing:

- the package name and a short description of what it does;
- the URL of its `PackageInfo.g` file;
- the URL of its source repository, if it has one;
- how it relates to existing packages or library functionality, if it
  overlaps with any;
- confirmation that you ran the [checks below](#checking-your-package-locally).

Anyone may do this on behalf of the package authors, but only with their
consent.

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

### Requirements

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

We also recommend a public source repository with an issue tracker, and
continuous integration as set up in the
[Example package](https://github.com/gap-packages/example).
[PackageMaker](https://github.com/gap-packages/PackageMaker) creates a new
package with all of this in place.

### Checking your package locally

You need a GAP installation with all distributed packages installed and
compiled; the release archive from the
[download page]({{ site.baseurl }}/install/) has them. Put your package into
a directory, here `DIR`, and run these commands from the GAP root directory.
Each exits with status 0 on success.

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

The continuous integration setup of the Example package runs these tests on
every change to your repository.
