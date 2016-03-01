# GapWWW

[![Build Status](https://travis-ci.org/gap-system/GapWWW.svg?branch=master)](https://travis-ci.org/gap-system/GapWWW)

This is the source repository for the GAP website http://www.gap-system.org.

The GAP website is NOT hosted on GitHub pages, and therefore there is NO
branch named `gh-pages` here. We host it elsewhere, but we use GitHub for
collaborative work on the website. We welcome contributions ranging from 
fixed typos and updated details to suggestions regarding the structure of 
the website and its improved look.

For small improvements (e.g. correcting details and fixing typos), the 
procedure is as simple as just submitting an issue or pull request here.
Please take into account that some files, in particular package overview 
pages in `Packages/<pkgname>.mixer` are generated automatically from the
meta-date in `PackageInfo.g` files. Incorrect information there should 
not be changed via pull requests, but reported to package authors instead.
In doubt, please submit an issue before making a pull request, and we 
will be able to advise on further steps.

For larger changes, it will be useful to build a local version of the GAP
website first. The GAP website uses the the Python script called **Mixer**
that uses a C library to parse XML documents and generate HTML pages. 
Mixer is contained in the following repository:

  https://github.com/gap-system/Mixer

or can be downloaded from this page:

  http://www.math.rwth-aachen.de/~Max.Neunhoeffer/Computer/Software/mixer.html
  
To build Mixer, you will need a C compiler (for compiling parts of the Mixer) 
and a Python interpreter (for running the Mixer). With Mixer, you may run 
the `mixer.py` script (probably with `-f` option to rebuild everything 
regardless the timestamps) inside the `GapWWW` working directory to check 
how produced html pages look like in your browser before committing and 
pushing the changes.

To set up a local copy of the Gap website (except files that are copied
from the GAP distribution, i.e. manuals of GAP and its packages), do the
following:

```
git clone https://github.com/gap-system/Mixer.git
cd Mixer
make
cd ..

git clone https://github.com/gap-system/GapWWW.git
cd GapWWW
../Mixer/mixer.py -f
```

This will process all `*.mixer` files in `GapWWW` and its subdirectories.
Now you shoud be able to browse local version of the GAP website by opening
`GapWWW/index.html` in your browser.
