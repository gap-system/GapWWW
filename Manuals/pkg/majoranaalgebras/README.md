[![Build Status](https://travis-ci.org/MWhybrow92/MajoranaAlgebras.svg?branch=master)](https://travis-ci.org/MWhybrow92/MajoranaAlgebras)
[![Code Coverage](https://codecov.io/github/gap-system/gap/coverage.svg?branch=master&token=)](https://codecov.io/gh/MWhybrow92/MajoranaAlgebras)

# MajoranaAlgebras

This is a GAP package for constructing Majorana representations of finite groups. The package implements the algorithm described in the paper "Constructing Majorana representations" (https://arxiv.org/abs/1803.10723) by M. Pfeiffer and M. Whybrow.

## Getting Started

To get the latest version of the package, go to the [MajoranaAlgebras](https://mwhybrow92.github.io/MajoranaAlgebras/) and download `MajoranaAlgebras-x.x.tar.gz`. Inside the `pkg` directory of your GAP installation, unpack `MajoranaAlgebras-x.x.tar.gz` by, for example, doing

    tar -xzf MajoranaAlgebras-x.x.tar.gz

You may also need to install the following packages

* [automata](https://gap-packages.github.io/automata/)
* [datastructures](https://gap-packages.github.io/datastructures/)
* [Gauss](https://homalg-project.github.io/homalg_project/Gauss/)

Start GAP in the usual way and call

    LoadPackage("MajoranaAlgebras");
