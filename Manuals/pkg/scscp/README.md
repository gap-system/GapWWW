[![Build Status](https://travis-ci.org/gap-packages/scscp.svg?branch=master)](https://travis-ci.org/gap-packages/scscp)
[![Code Coverage](https://codecov.io/github/gap-packages/scscp/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/scscp)

# SCSCP

The GAP package SCSCP implements the Symbolic Computation Software
Composability Protocol for the computational algebra system GAP in
accordance with:

* SCSCP specification:
    https://www.openmath.org/standard/scscp/
* OpenMath content dictionary scscp1:
    http://www.win.tue.nl/SCIEnce/cds/scscp1.html
* OpenMath content dictionary scscp2:
    http://www.win.tue.nl/SCIEnce/cds/scscp2.html

To run the demo, open two terminal windows. In the first window,
start the server with

    cd <path>/scscp/example
    gap myserver.g

and then in the second window start the demo with

    cd <path>/scscp/demo
    gap rundemo.g

In the GAP session started by the demo, press any key other than 'q'
to run the next command, and press 'q' to stop the demo.


# Issue tracker

Please submit bug reports, suggestions for improvements and patches
via the issue tracker: https://github.com/gap-packages/scscp/issues.

Alexander Konovalov, Steve Linton
