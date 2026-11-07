---
title: macOS
layout: default_with_title
parent: Installation
nav_order: 3
permalink: /install/mac/
---

## Install via Homebrew

A relatively easy way to install GAP is via [Homebrew](https://brew.sh), a
package manager for macOS. If you don't have it already, install it first by
following the instructions on its website.

Then enter the following command into a terminal:

    brew install gap-system/gap/gap

Depending on your machine this may take a couple of minutes or longer, as it
builds GAP and as many GAP packages as possible. Afterwards you can start GAP
by entering

    gap

into a terminal.

{: .warning }
> The [GAP Homebrew tap](https://github.com/gap-system/homebrew-gap) is
> unofficial: the GAP team does not support it, and it may not always provide
> the latest GAP release. If it does not work for you, install from source.

## Install from source

### Step 1: Install prerequisites

You need the Apple command line developer tools, which provide a C and a C++
compiler and `make`:

1. Open the Terminal application (found in the Utilities folder inside the
   Applications folder), enter the command `xcode-select --install`, then
   press enter.
2. If it says <q>Command line tools are already installed</q>, you are done.
   Otherwise a window appears, asking whether you would like to install the
   tools now. Confirm this by clicking <q>Install</q>.
3. Wait for the download and installation to complete.
4. Verify that the folder `/Library/Developer/CommandLineTools/usr/bin/`
   exists and contains executables such as `clang` and `clang++`, the C and
   C++ compilers.

We also recommend installing GMP and GNU Readline; without the latter, command
line editing in GAP is limited. With Homebrew:

    brew install gmp readline

With MacPorts:

    sudo port install gmp readline

{: .note }
> Several GAP packages have additional dependencies, listed in
> [INSTALL.md](https://github.com/gap-system/gap/blob/v{{site.data.release.version}}/INSTALL.md).
> With Homebrew, install most of them with
>
>     brew install autoconf automake libtool cddlib curl fplll libmpc \
>                  libx11 mpfi mpfr nauty ncurses pari singular xorgproto \
>                  zeromq

{% include install_from_source.md %}

## Alternatives

### Gap.app

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
