---
title: Undistributed Packages
layout: default_with_title
parent: GAP Packages
permalink: /packages/undistributed/
---

These GAP packages are not distributed with GAP. Some are still in
development, some were never meant for wide use, and some authors prefer to
publish their packages themselves. We do not test them, so a package here may
not work with your version of GAP, or may not install at all.

### Installing

You can try to install a package with
[PackageManager](https://github.com/gap-packages/PackageManager), from the
URL of its `PackageInfo.g` file if the list gives one, or else from its git
repository:

```gap
LoadPackage("PackageManager");
InstallPackage("https://gap-packages.github.io/quickcheck/PackageInfo.g");
InstallPackage("https://github.com/isadofschi/posets.git");
```

We have not tried this for the packages listed here, so it may fail; then
follow the installation instructions on the package's homepage or in its
repository.

### The list

| Package | Description | Links |
|---------|-------------|-------|
{% for entry in site.data.undistributed_packages -%}{%- assign p = entry[1] -%}
| {% if p.PackageWWWHome %}[{{ p.PackageName }}]({{ p.PackageWWWHome }}){% elsif p.SourceRepository %}[{{ p.PackageName }}]({{ p.SourceRepository.URL }}){% else %}{{ p.PackageName }}{% endif %} | {{ p.Subtitle }} | {% if p.PackageWWWHome %}[homepage]({{ p.PackageWWWHome }}) {% endif %}{% if p.SourceRepository %}[source]({{ p.SourceRepository.URL }}) {% endif %}{% if p.PackageInfoURL %}[`PackageInfo.g`]({{ p.PackageInfoURL }}){% endif %} |
{% endfor %}

### Adding a package

To add your package or change its entry, edit
[`_data/undistributed_packages.yml`](https://github.com/gap-system/GapWWW/edit/master/_data/undistributed_packages.yml)
and open a pull request, or tell us on the
[GAP development list]({{ site.baseurl }}/forum/#gap-development-list).
Give the URL of your package's `PackageInfo.g` if it publishes one, so that
PackageManager can find it. Listing a package here is also a good first
step towards [submitting it]({{ site.baseurl }}/packages/submit/) for
distribution with GAP.

### For tools

The list is also available as JSON at
[`/packages/undistributed.json`]({{ site.baseurl }}/packages/undistributed.json).
As in the `package-infos.json` of the package distribution, it is an object
whose keys are the lowercase package names. Its fields are named as in
`PackageInfo.g`: `PackageName`, `Subtitle`, `PackageWWWHome`,
`SourceRepository` and `PackageInfoURL`. All but the first two are
optional.
