---
title: GAP Packages
layout: default_with_title
has_children: true
nav_order: 5
permalink: /packages/
---

<!-- load datatables -->
<script src="{{ site.baseurl }}/assets/js/datatables.min.js?version=1"></script>

<script type="module" src="{{ site.baseurl }}/assets/js/loadPackageTable.js?version=3"></script>

<!-- List of deposited packages -->
There are {{ site.data.package-infos | size }} packages that are shipped with GAP {{site.data.release.version}}.
Note that newer versions might be available on the package websites.

<!-- Create a table so it can be filled by Datatables -->

|   | Name | Version | Date | | Subtitle |
|-
| 
|=
|   | Name | Version | Date | | Subtitle |
{: id="packageList" class="display"}

The table above is generated using the open source software [Datatables](https://datatables.net/).

