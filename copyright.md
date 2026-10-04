---
title: Copyright and License
layout: default_with_title
nav_exclude: true
permalink: /copyright/
---

GAP is Copyright © 1987--{{ site.data.release.date | date: "%Y" }} by its authors,
who are listed in the file
[`COPYRIGHT`](https://github.com/gap-system/gap/blob/master/COPYRIGHT)
of the GAP distribution. Files in the distribution that carry a different
copyright statement are excepted.

## License

GAP is free software; you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation; either version 2 of the License, or (at your option) any later
version. The SPDX identifier for this is `GPL-2.0-or-later`.

GAP is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
details.

The text of the license is in the file
[`LICENSE`](https://github.com/gap-system/gap/blob/master/LICENSE)
of the GAP distribution and on the
[website of the Free Software Foundation](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html).

## Packages

The above covers GAP itself, not the
{{ site.data.package-infos | size }} [packages]({{ site.baseurl }}/packages/)
distributed with it. Each package is a separate work: its copyright is held
by its authors or their institutions, and it has its own license, which
need not be the license of GAP. Check the license of every package you use
or redistribute.

Each distributed package states its license as an
[SPDX identifier](https://spdx.org/licenses/) in the `License` field of its
`PackageInfo.g` file. The [package list]({{ site.baseurl }}/packages/) shows
it in the details of each package.

Some packages include a copy of an external program or a data library that
they provide an interface to. These have their own authors and may have
their own terms; see the documentation of the package.

## Third-party software

The GAP source distribution includes copies of the libraries
[GMP](https://gmplib.org) and [zlib](https://zlib.net) in the directory
`extern`, each under its own license.

GAP uses [GNU Readline](https://www.gnu.org/software/readline/) if it is
available when GAP is built. Readline is licensed under version 3 or later
of the GNU General Public License, so a GAP executable linked with it may
only be redistributed under version 3 or later, not under version 2.

GAP for Windows is built with [Cygwin](https://cygwin.com) and linked with
Readline, so the above applies to it. Its installer also contains a Cygwin
environment with further third-party software, for example Git and
Singular, each provided under its own license.

## Logo

The GAP logo has separate terms, see [The GAP Logo]({{ site.baseurl }}/logo/).

## This website

The content of this website is Copyright © by its contributors; its source
is at <https://github.com/gap-system/GapWWW>. Excepted are

- third-party components such as MathJax, DataTables, the Ubuntu fonts and
  the Just the Docs theme, which have their own licenses;
- the forum archive, whose messages belong to their authors.

## Citing GAP

If you publish a result that was partly obtained using GAP, please
[cite it]({{ site.baseurl }}/cite/).
