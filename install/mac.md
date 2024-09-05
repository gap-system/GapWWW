---
title: MacOS
layout: default_with_title
parent: Installation
nav_order: 3
permalink: /install/mac/
---

{% assign unix_assets    = "" | split: ',' %}

{% capture gap_prefix %}gap-{{ site.data.release.version }}{% endcapture %}
{% assign len = gap_prefix | size %}

{% for asset in site.data.assets %}
  {% assign asset_prefix = asset.name | slice: 0, len %}
  {% if asset_prefix == gap_prefix %}{% unless asset.name contains "-core" %}
    {% assign asset_suffix = asset.name | split: "" | reverse | join: "" | slice: 0, 4 %}
    {% if asset_suffix == "exe." %}
      {% assign windows_assets = windows_assets | push: asset %}
    {% else %}
      {% assign unix_assets = unix_assets | push: asset %}
    {% endif %}
    {% endunless %}{% endif %}
{% endfor %}

Installing the GAP distribution with all the packages and full data
libraries from source code requires a working C and C++ development
environment on your system as well as GNU `make`.

You need to install the Apple developer tools. If you are on
macOS 10.11 or newer, this can be achieved by opening a terminal window
and entering the command

    xcode-select --install

A window will appear
asking you whether you would like to install the command line developer
tools. Confirm this by clicking the “Install” button. After this
completed, you can verify that it worked by verifying that the directory
`/Library/Developer/CommandLineTools/usr/bin/` exists and contains executables
such as `clang` and `clang++`.


Note that to obtain a fully functional GAP installation you need not only to
compile the core system, but also some of its packages. To install
GAP using the source distribution, perform the following steps:

1. Verify that all required tools are installed (see above and also get `gmp` and `readline`).
Use your package manager (e.g. `brew`, `port` or `fink`) for that.
1. Choose your preferred archive format and download the corresponding archive.
   <table>
   <colgroup>
    <col width="15%">
    <col width="5%">
    <col>
   </colgroup>
   {% for asset in unix_assets %}
   <tr>
     <td>
       <a href="{{ asset.url }}">{{ asset.name }}</a>
     </td>
     <td>{{ asset.bytes | divided_by: 1048576 }} MB</td>
     <td>sha256: <code>{{ asset.sha256 }}</code> </td>
   </tr>
   {% endfor %}
   </table>
1. Unpack the archive.
1. Compile the GAP core system by running
   ```
   ./configure && make
   ```
   in the unpacked directory.
1. Change to the `pkg` subdirectory and call
   ```
   ../bin/BuildPackages.sh
   ```
   to run the script which will build most of the packages that require
   compilation (provided sufficiently many libraries, headers and tools are
   available). If something doesn't work on your system, please refer to the
   `README` file provided with the corresponding package.
1. Adjust some links/scripts/icons etc., to
make the new version of GAP available to the users of your machine.
1. Optional: run a few tests.




<h2>Alternatives</h2>

#### Homebrew

[Homebrew](http://brew.sh/) is a package manager for macOS.
If you use Homebrew, you can install GAP using the
[GAP Homebrew tap](https://github.com/gap-system/homebrew-gap).

#### Gap.app

[Gap.app](https://cocoagap.sourceforge.io/) is a native macOS frontend
and distribution of GAP, developed by Russ Woodroofe.  The "Gap.app + GAP" edition
includes a fairly complete copy of GAP, and can be installed by simply downloading a
disk image and dragging Gap.app to the Applications folder.  You can also install the built-in
GAP for use from your usual terminal via the Install GAP Command For Shell menu option
(found under the Gap menu in the GUI frontend).

The included GAP comes with working copies of most of the packages in the
standard GAP distribution.  Gap.app is compatible with
[XGAP](https://gap-packages.github.io/xgap/), and allows interactive display
of subgroup lattices with the `GraphicSubgroupLattice` command.
The version of GAP that comes with Gap.app may lag slightly behind the very latest.
Full details on the currently included GAP may be found in the
[Gap.app FAQ](https://cocoagap.sourceforge.io/faq.html#gapversioninfo).
