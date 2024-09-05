---
title: Linux
layout: default_with_title
parent: Installation
nav_order: 2
permalink: /install/linux/
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


To install development tools on a Linux system, use your preferred package
manager (e.g. apt-get or aptitude or Synaptic etc.).
You need a working C and C++ development environment on your system as well as GNU `make`.

Note that to obtain a fully functional GAP installation you need not only to
compile the core system, but also some of its packages. To install
GAP using the source distribution, perform the following steps:

1. Verify that all required tools are installed. For example, on Ubuntu or Debian do this by calling
    ```
    sudo apt-get install build-essential autoconf libtool libgmp-dev libreadline-dev zlib1g-dev
    ```

1. Choose your preferred archive format and download
   the corresponding archive.
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
1. Adjust some links/scripts/icons etc., to make the new version of GAP available to the users of your machine.
1. Optional: run a few tests.

#### Alternatives

{% include namelink.html name="Frank Lübeck" %} offers a
<a href="https://www.math.rwth-aachen.de/~Frank.Luebeck/GAPrsync/">Linux
binary distribution</a> via remote syncronization with a reference
installation which includes all packages and some optimisations.

GAP is available for installation in several package managers. A good overview
of available GAP packages is available on [this repology project page](https://repology.org/project/gap/versions).
