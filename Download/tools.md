---
title: Tools needed to install GAP from source
layout: default
toc: Installation
---

Installing the GAP distribution with all the packages and full data
libraries from source code (as opposed to via e.g. the Windows
binary installer for GAP) requires a working C and C++ development
environment on your system as well as GNU make. You will also need
the [GMP library](https://gmplib.org); most, but not all
standard development environments include this. Furthermore, if the
GNU readline library is detected on your system at compile time, it
will be used for command line editing.

On macOS, you need to install the Apple developer tools. If you are on
macOS 10.11 or newer, this can be achieved by opening a terminal window
and entering the command `xcode-select --install`. A window will appear
asking you whether you would like to install the command line developer
tools. Confirm this by clicking the “Install” button. After this
completed, you can verify that it worked by verifying that the directory
`/Library/Developer/CommandLineTools/usr/bin/` exists and contains executables
such as `clang` and `clang++`.

Since Windows binaries for GAP and some packages are contained in the GAP
installer for Windows, you do not need to install any additional 
tools for Windows. However, if you want to try to build binaries 
for more packages, you may install [Cygwin](https://www.cygwin.com)
to get a UNIX environment for Windows, selecting all needed tools 
during Cygwin installation.

To install development tools on a Linux system, use your preferred package 
manager (e.g. apt-get or aptitude or Synaptic etc.). For example, on Ubuntu
or Debian we suggest that you call

      sudo apt-get install build-essential autoconf libtool libgmp-dev libreadline-dev zlib1g-dev

before calling `configure` in the GAP root directory.

To get maximum benefit from GAP and from various packages it may be useful 
to install a number of other free software libraries (and their associated 
development tools) although they are not required for basic operation. 
For example, 

<dl>
<dt><a href="../Packages/browse.html">Browse</a></dt>
	<dd>needs the ncurses library
	(e.g. libncurses5-dev and libncursesw5-dev);</dd>
<dt><a href="../Packages/nq.html">nq</a></dt>
	<dd> needs some version of awk
	(e.g. gawk or mawk);</dd>
<dt><a href="../Packages/fr.html">FR</a></dt>
	<dd> may need wget;</dd>
<dt><a href="../Packages/xgap.html">XGAP</a></dt>
	<dd>requires the following X11 libraries: libXaw, libXmu, libXt,
	libXext, libX11, libSM, and libICE
	(e.g. libx11-dev, libxaw7-dev, libxt-dev which possibly aready install
	the other four libxmu-dev, libxext-dev, libsm-dev, libice-dev);</dd>
</dl>

Other packages not listed here may have additional requirements listed in their documentation.

