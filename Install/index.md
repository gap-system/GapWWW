---
title: Installation
layout: default_with_title
has_children: true
nav_order: 2
---

The latest version of GAP is {{site.data.release.version}} released on {{site.data.release.date}}.
For an overview of changes see the
<a href="https://github.com/gap-system/gap/blob/master/CHANGES.md#{{anchor}}">CHANGES.md</a> file.

There are several ways to install GAP:

- <a href="linux.html">Linux</a> and other Unix-like operating systems
- <a href="mac.html">MacOS</a>
- <a href="windows.html">Windows</a>

More detailed instructions can be found in <a href="https://github.com/gap-system/gap/blob/v{{site.data.release.version}}/INSTALL.md">INSTALL.md</a>.


GAP may compile and work for you on other systems, and if so we would 
be interested to know about it.
<!-- 
You can also try GAP online in a <a href="https://jupyter.org/">Jupyter</a>
notebook running on <a href="https://mybinder.org/">Binder</a>, following
instructions from the README file in <a
href="https://github.com/gap-system/try-gap-in-jupyter">this repository</a>.
 -->
Moreover, it is also possible to use GAP via a free account on
[CoCalc](https://cocalc.com/).
The combination of GAP packages available there may differ from
the one from the official GAP distribution; however, the maintainers
of CoCalc would love to hear about any additional packages you
would like to be installed or any questions you might have
(email <help@cocalc.com>).


### Getting Started

If you followed all instruction steps you can test you installation as described below. 
If it works and you are new to GAP you may try to start reading and
trying the examples in the first chapters of the <a
href="{{ site.docsurl }}/doc/tut/chap0_mj.html">Tutorial</a>
[<a href="{{ site.docsurl }}/doc/tut/manual.pdf">PDF version</a>].
In particular, it is explained how to use the extensive documentation
from inside GAP.


### Testing the Installation<a name="Test"></a>

For a quick test of your installation you may start GAP.
Normally, you will see a GAP&nbsp;4 banner and the information about loaded 
components and packages. This information may vary depending 
on  your installation.  For  example,  for  the complete installation of 
latest versions of all packages you will have something like:

```
 ┌───────┐   GAP 4.13.0 of 2024-03-15
 │  GAP  │   https://www.gap-system.org
 └───────┘   Architecture: aarch64-apple-darwin21-default64-kv9
 Configuration:  gmp 6.3.0, GASMAN, readline
 Loading the library and packages ...
 Packages:   AClib 1.3.2, Alnuth 3.2.1, AtlasRep 2.1.8, AutPGrp 1.11,
             Browse 1.8.21, CRISP 1.4.6, Cryst 4.1.27, CrystCat 1.1.10,
             CTblLib 1.3.9, curlInterface 2.3.2, cvec 2.8.1, FactInt 1.6.3,
             FGA 1.5.0, Forms 1.2.9, GAPDoc 1.6.7, genss 1.6.8, IO 4.8.2,
             IRREDSOL 1.4.4, LAGUNA 3.9.6, orb 4.9.0, Polenta 1.3.10,
             Polycyclic 2.16, PrimGrp 3.4.4, RadiRoot 2.9, recog 1.4.2,
             ResClasses 4.7.3, SmallGrp 1.5.3, Sophus 1.27, SpinSym 1.5.2,
             StandardFF 1.0, TomLib 1.2.11, TransGrp 3.6.5, utils 0.85
 Try '??help' for help. See also '?copyright', '?cite' and '?authors'
gap> 
```

Now you may
type  a  few  commands at the prompt and run a short test suite (which
will run for up to a few minutes, depending on the speed of your computer).
If you observe any discrepancies, see the next section.

```
gap> 3^80;
147808829414345923316083210206383297601
gap> tst := Filename( DirectoriesLibrary("tst"), "testinstall.g" );;
gap> Read(tst);
Architecture: aarch64-apple-darwin21-default64-kv9

testing: /Users/mhorn/gap/tst/testinstall/ConjNatSym.tst
      35 ms (4 ms GC) and 23.8MB allocated for ConjNatSym.tst
testing: /Users/mhorn/gap/tst/testinstall/DirectProductElement.tst
      33 ms (30 ms GC) and 684KB allocated for DirectProductElement.tst
testing: /Users/mhorn/gap/tst/testinstall/ElmsBlist.tst
      36 ms (27 ms GC) and 4.33MB allocated for ElmsBlist.tst

[...  more lines deleted]

testing: /Users/mhorn/gap/tst/testinstall/zmodnz.tst
      60 ms (54 ms GC) and 2.23MB allocated for zmodnz.tst
testing: /Users/mhorn/gap/tst/testinstall/zmodnze.tst
      59 ms (57 ms GC) and 1.33MB allocated for zmodnze.tst
-----------------------------------
total     34300 ms (14129 ms GC) and 10.1GB allocated
              0 failures in 296 files

#I  No errors detected while testing

```

### If Things Go Wrong

If you encounter problems with the above steps, please try the following -
in this order:

- Look at the "If Things Go Wrong" section of the
<a href="https://github.com/gap-system/gap/blob/master/INSTALL.md">GAP {{site.data.release.version}} Installation Instructions</a>,
it contains some additional remarks and troubleshooting advices.
- Tell us about your problem by writing an email to <support@gap-system.org>.


#### Upgrading

If you have any version of GAP older than the current version, the only way to install a new version of GAP is a new installation.
If you installed GAP from the standard distribution and have not manually installed additional or 
updated packages in your GAP distribution (which is no
longer necessary -- instead we recommend that you 
install them in the 
{% include ref.html label="GAP Root Directories" text="user specific GAP root directory" %}) 
then you can always upgrade to the latest version of GAP by moving the old version aside 
and downloading and installing the current archives, and this is the approach we recommend 
for most users. Make sure that you update any scripts or links to refer to the new version.
