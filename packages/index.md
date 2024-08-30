---
title: GAP Packages
layout: default_with_title
has_children: true
nav_order: 5
permalink: /packages/
---

<!-- load jQuery, as it is needed for datatables -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<!-- load moment.js for date formatting and sorting -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment.min.js"></script>

<!-- load datatables itself -->
<script src="https://cdn.datatables.net/2.0.2/js/dataTables.js"></script>

<script type="module" src="{{ site.baseurl }}/assets/js/loadPackageTable.js?version=2"></script>

<!-- List of deposited packages -->
There are {{ site.data.package-infos | size }} packages that are shipped with GAP {{site.data.release.version}}.
Note that newer versions might be available on the package websites.

<!-- Create a table so it can be filled by Datatables -->
{% assign pkgs = site.data.package-infos | sort %}

|   | Name | Version | Date | Subtitle |
|-
{% for namepkg in site.data.package-infos -%}{%- assign pkg = namepkg[1] -%}
|   | [{{ pkg.PackageName }}]({{ pkg.PackageWWWHome }}) | {{ pkg.Version }} | {{ pkg.Date }} | {{ pkg.Subtitle }} |
{% endfor -%}
|=
|   | Name | Version | Date | Subtitle |
{: id="packageList" class="display"}

The table above is generated using the open source software [Datatables](https://datatables.net/).
It requires JavaScript to enable all features and make all data available.
