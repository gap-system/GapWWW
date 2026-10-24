---
title: Windows
layout: default_with_title
parent: Installation
nav_order: 4
permalink: /install/windows/
---

{%- capture installer_prefix %}gap-{{ site.data.release.version }}-{% endcapture %}
{%- assign len = installer_prefix | size %}

## Install via the Windows installer

Download and run the installer:

<table>
<colgroup>
 <col width="15%">
 <col width="5%">
 <col>
</colgroup>
{%- for asset in site.data.assets %}
{%- assign asset_prefix = asset.name | slice: 0, len %}
{%- assign asset_suffix = asset.name | slice: -4, 4 %}
{%- if asset_prefix == installer_prefix and asset_suffix == ".exe" %}
<tr>
  <td>
    <a href="{{ asset.url }}">{{ asset.name }}</a>
  </td>
  <td>{{ asset.bytes | divided_by: 1048576 }} MB</td>
  <td>sha256: <code>{{ asset.sha256 }}</code> </td>
</tr>
{%- endif %}
{%- endfor %}
</table>

It contains binaries for GAP (compiled with support for the GMP and readline
libraries) and almost all GAP packages, so no compilation is needed. During
the installation you can choose the installation path, and whether to install
for all users or just for yourself.

## Install via the Windows Subsystem for Linux

The [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/about)
(WSL) lets you run a Linux distribution inside Windows 10 or later. We
recommend it to users who are familiar with Linux or Unix, and it is the only
way to use GAP packages which we do not build Windows binaries for.

[Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install), then
follow the [installation instructions for Linux]({{ site.baseurl }}/install/linux/)
inside it.
