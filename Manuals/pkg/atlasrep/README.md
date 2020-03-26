
The GAP 4 Package **AtlasRep**
==============================

Description
-----------

This is Version 2.1.0 of the package **AtlasRep** written for GAP 4,
whose aim is to provide an interface between GAP and databases such as the
[Atlas of Group Representations](http://brauer.maths.qmul.ac.uk/Atlas),
which is available independent of GAP;
it comprises representations of many almost simple groups
and information about their maximal subgroups.

The **AtlasRep** package consists of this database and a GAP interface.
The latter allows the user to get an overview of the database,
and to access the data in GAP format.
Note that the package archive does *NOT* contain the data part,
the GAP interface accesses the data on demand via the internet.

To get an impression about the capabilities of the package,
look at the manual chapter "Tutorial for the AtlasRep Package".


Authors
-------

The data files of the ATLAS of Group Representations have been prepared by
Robert Wilson, Peter Walsh, Jonathan Tripp, Ibrahim Suleiman, Richard Parker,
Simon Norton, Simon Nickerson, Steve Linton, John Bray, and Rachel Abbott
(in reverse alphabetical order).

The GAP interface was written by Thomas Breuer and Simon Nickerson.


Installation
------------

**AtlasRep** is usually contained in the current GAP distribution,
see (http://www.gap-system.org/Download/).
To fetch another version follow the hints below.

Installation of **AtlasRep** means unpacking the archive file
in an appropriate directory.

No kernel module has to be compiled,
but some configuration issues might be of interest
before you start to use the package in a GAP session.
They are described in the manual sections

- "Installing the AtlasRep Package" and
- "User Parameters for the AtlasRep Package".

After installation you can load **AtlasRep** into your GAP session with:

```
gap> LoadPackage( "atlasrep" );
```


Fetching **AtlasRep** separately
--------------------------------

To get the newest version of the **AtlasRep** package download the archive file
(where `x.y` stands for the highest available version number)
`atlasrep-x.y.tar.gz`
from (http://www.math.rwth-aachen.de/~Thomas.Breuer/atlasrep)
or from (www.gap-system.org)
and unpack it using
```
gunzip atlasrep-x.y.tar.gz; tar xvf atlasrep-x.y.tar
```
Note that if you use a web browser for downloading the archive file
the `gunzip` step above may already be done by the browser,
although the name of your file may still have the misleading `.gz` extension.

The unpacking is done preferably (but not necessarily) inside the `pkg`
subdirectory of your GAP 4 installation.
It creates a  subdirectory called `atlasrep`.


Homepage
--------

The [**internet homepage** of the **AtlasRep** package](http://www.math.rwth-aachen.de/~Thomas.Breuer/atlasrep)
provides

* package archives,

* introductory package information,

* the table of contents of core data in the file
  [`atlasprm.json`](http://www.math.rwth-aachen.de/~Thomas.Breuer/atlasrep/atlasprm.json)
  of the package,

* the [list of changes of remote core data files](http://www.math.rwth-aachen.de/~Thomas.Breuer/atlasrep/htm/data/changes.htm),

* a [starter archive](http://www.math.rwth-aachen.de/~Thomas.Breuer/atlasrep/atlasrepdata.tar.gz)
  containing many small representations and programs,
  and

* an [overview of the core data](http://www.math.rwth-aachen.de/~Thomas.Breuer/atlasrep/htm/data/),
  in a similar format as the information shown by the function
  `DisplayAtlasInfo` of the package;
  more details can be found on the
  [home page of the ATLAS of Group Representations](http://brauer.maths.qmul.ac.uk/Atlas).


License
-------

This package may be distributed under the terms and conditions of the
[**GNU Public License**](http://www.gnu.org/licenses) Version 3 or later.


                            Thomas Breuer (Thomas.Breuer@Math.RWTH-Aachen.De)
