---
title: Windows
layout: default_with_title
parent: Installation
nav_order: 4
permalink: /install/windows/
---

{% assign windows_assets = "" | split: ',' %}

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
environment on your system as well as GNU make.

For users of Windows 10 or later who are familiar with Linux or Unix, we recommend using GAP via the
[Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/about).

If this is not possible, a <code>.exe</code> installer is available in the table below.
It contains binaries for GAP (compiled with the support of GMP and readline libraries) and almost all
GAP packages, and provides the standard installation procedure.
No compilation is needed, since compiled executables for GAP
and some packages are already provided by the <code>.exe</code> installer.

<table>
    <colgroup>
     <col width="15%">
     <col width="5%">
     <col>
    </colgroup>
  {% for asset in windows_assets %}
  <tr>
    <td>
      <a href="{{ asset.url }}">{{ asset.name }}</a>
    </td>
    <td>{{ asset.bytes | divided_by: 1048576 }} MB</td>
    <td>sha256: <code>{{ asset.sha256 }}</code> </td>
  </tr>
  {% endfor %}
  </table>


If you want to use packages we do not build binaries for, we strongly encourage using
the [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/about).
