---
title: How to cite GAP
layout: default_with_title
nav_order: 6
---
GAP is written and developed by many people. A list of authors can be found [here](https://github.com/gap-system/gap/blob/master/COPYRIGHT).

If you have used GAP 4 in the preparation of a paper please cite it as
described below.

\[GAP{{site.data.release.date | date: "%Y" }}\]
:   The GAP Group, GAP \-- Groups, Algorithms, and Programming, Version
    {{site.data.release.version}}; {{site.data.release.date | date: "%Y" }}.
    (https://www.gap-system.org)

If you have (predominantly) used one or more particular GAP packages,
please cite these packages in addition to GAP itself. (Either check the
package documentation if it suggests how to cite it, or use a scheme
like:

\[PKG\]
:   \<Author name(s)\>, \<package name\> - a GAP package, \<package
    version\>, \<package date\>, \<package web address\>

You find the necessary information for each package from the [package
overview]({{ site.baseurl }}/Packages/packages.html) page.)

If you are using BibTeX, you can use the following BibTeX entry for the
current GAP version, making sure you have `\usepackage{url}` (or
`\usepackage{hyperref}` if you want hyperlinks) in the preamble of your
LaTeX document):

      @manual{GAP4,
        key          = "GAP",
        organization = "The GAP~Group",
        title        = "{GAP -- Groups, Algorithms, and Programming,
                        Version {{site.data.release.version}}}",
        year         = {{site.data.release.date | date: "%Y" }},
        url          = "\url{https://www.gap-system.org}",
        }

If you are not using BibTeX, here is the bibliography entry produced by
BibTeX (in bibliography style 'alpha'). You can use this inside the
bibliography environment of LaTeX.

      \bibitem[GAP]{GAP4}
      The GAP~Group, \emph{GAP -- Groups, Algorithms, and Programming, 
      Version {{site.data.release.version}}}; 
      {{site.data.release.date | date: "%Y" }},
      \url{https://www.gap-system.org}.

When linking to GAP from a web page you can use the link

      <a href="https://www.gap-system.org/">GAP</a>.

Instructions on citing GAP and its packages may be also found in the
CITATION file in the GAP root directory or displayed in GAP using the
function {% include ref.html label="Cite" %}.

We also would be indebted if you inform us about your papers citing GAP
by sending a short note to
[`support@gap-system.org`](mailto:support@gap-system.org).
