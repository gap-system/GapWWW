---
title: Reporting issues
layout: default_with_title
parent: Help & Community
permalink: /issues/
nav_order: 1
---

While we try to check the GAP system as rigorously as we can, such a
large system will inevitably contain bugs. We regularly issue bugfixes
and welcome bug reports. However since GAP is available free and the GAP
authors work on the system as part of their research, we would like to
ask you to make sure that the problem really is a bug before reporting
it:

If your calculation runs into error, please check:

-   Do you have the most recent version of GAP installed?
-   If want to check if the bug that you are encountering may have been
    fixed already recently, have a look at the
    [Release history](https://github.com/gap-system/gap/blob/master/CHANGES.md).
-   What does the error message you get tell you? The error message
    might say that GAP ran out of memory or ('*No method found*') that
    the functionality is not available for the kind of objects you work
    with.

When reporting the error, please state:

-   What version of GAP and what computer you are using and possibly
    what compiler you used in installing GAP (some of this information
    will be contained in the banner you see when starting up GAP).
-   What is your input. (Please also include the definitions of your
    objects so that we can redo the calculation.)
-   What output do you get?

Before formulating a bug report it may be helpful to consult some
additional advice given in
[How to Report Bugs Effectively](http://www.chiark.greenend.org.uk/~sgtatham/bugs.html).

### Bug in GAP or in a package?

Much of GAP's functionality comes from packages. The bug is probably in a
package if the function you called is documented in a package manual, or if
the stack trace printed with the error names a file in a `pkg` directory.
Report such bugs to the package authors: on the
[list of packages]({{ site.baseurl }}/packages/), expand the package's row
for a link to its issue tracker. If you are unsure, use the GAP issue
tracker.

### Where to report

The preferred way to submit bug reports is to use the [GAP issue
tracker](https://github.com/gap-system/gap/issues) on GitHub.
Alternatively, you may send them to <support@gap-system.org>, which is read
by the [GAP Support Group]({{ site.baseurl }}/forum/#gap-support). When using
email, please don't attach any log files, suggested patches etc.
because this mailing list blocks attachments - put all the text into the
body of email instead.
