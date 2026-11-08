---
title: Linux
layout: default_with_title
parent: Installation
nav_order: 2
permalink: /install/linux/
---

## Install via your package manager

Many Linux distributions provide packages for GAP, usually named `gap`. For
example:

- Debian or Ubuntu: `sudo apt-get install gap`
- Fedora: `sudo dnf install gap`
- Arch Linux: `sudo pacman -S gap`

This is the easiest way to get GAP. Its downsides are that the packaged version
may lag behind the latest GAP release (see
[Repology](https://repology.org/project/gap/versions) for the version each
distribution ships), and that some distributions leave out some of the GAP
packages bundled with the GAP distribution, or put them into separate packages.

## Install from source

This takes more work, but gives you the latest GAP release with all its
packages, and is the best supported option.

### Step 1: Install prerequisites

You need a C and a C++ compiler and GNU `make`. We also recommend the
development headers for GMP, GNU Readline and zlib. On Ubuntu or Debian,
install all of these with

    sudo apt-get install build-essential autoconf libgmp-dev \
                         libreadline-dev zlib1g-dev

On Fedora:

    sudo dnf install gcc gcc-c++ make autoconf gmp-devel readline-devel zlib-devel

On Alpine:

    sudo apk add build-base autoconf gmp-dev readline-dev zlib-dev

{: .note }
> Several GAP packages have additional dependencies, listed in
> [INSTALL.md](https://github.com/gap-system/gap/blob/v{{site.data.release.version}}/INSTALL.md).
> On Ubuntu or Debian, install most of them with
>
>     sudo apt-get install 4ti2 pari-gp singular libncurses-dev \
>                          libcdd-dev libcurl4-openssl-dev libfplll-dev \
>                          libmpc-dev libmpfi-dev libmpfr-dev libzmq3-dev
>
> On Fedora:
>
>     sudo dnf install 4ti2-devel pari-gp Singular ncurses-devel \
>                      cddlib-devel curl-devel fplll \
>                      libmpc-devel mpfi-devel mpfr-devel zeromq-devel

{% include install_from_source.md %}

## Alternatives

{% include namelink.html name="Frank Lübeck" %} offers a
<a href="https://www.math.rwth-aachen.de/~Frank.Luebeck/GAPrsync/">Linux
binary distribution</a> via remote synchronization with a reference
installation which includes all packages and some optimisations.
