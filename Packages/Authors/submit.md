---
title: Submitting Contributions
layout: core
grand_parent: GAP Packages
parent: For Authors
---

The GAP group encourages users to make their GAP related work available
to other users. There used to be two main categories of external contributions
to GAP, those that have been formally accepted in a
refereeing process, and those that are just deposited.
However we stopped refereeing new packages in February 2024, and now
only accept new deposited packages.

Irrespective of this, you may consider organizing and maybe
distributing your code in the form of a GAP package. The page
[Information for GAP Package Authors]({{ site.baseurl }}/Packages/Authors/authors.html)
give detailed advice how to do this.

### Submitting Deposited Contributions

You are also invited to provide material that is not intended for formal
refereeing. To tell us about such material, contact
<support@gap-system.org>.

We will then review your package for certain formal properties,
and provide feedback based on that, with the expectation that
after possibly some back and forth your contribution can be accepted.

Things we will check include technical aspects such as:

- Does the package pass validation via `ValidatePackageInfo`?
- Is it clearly distributed under a license compatible with GAP's license (GPL 2)?
- Does it have an appropriate website which is set up so that automatic updates
  are possible (i.e. are `PackageInfoURL` and `ArchiveURL` in `PackageInfo.g` valid)?
- Does it specify a non-empty `TestFile` in its `PackageInfo.g` that can be used
  to verify that basic functionality of the package works?
- Can it be loaded together with all other distributed packages without
  e.g. errors caused by multiple packages declaring global variables
  or functions with identical name but different content?

Besides these technical aspects we *may* consider questions such as

-   Does the package do what it claims to?
-   Is its functionality a significant addition to GAP?
-   Does the package interact smoothly with the existing GAP library and
    packages?
-   Does the package employ appropriate GAP functions and data
    structures?
-   Is the main documentation clear and complete enough?

This last point is especially important. The installation of the package
must work as described in the installation guide. The package's documentation
should include straightforward and quick examples to help the user test the
installation, the examples of the manual must really work the way the
manual says, and the overall documentation should be organized sensibly.
