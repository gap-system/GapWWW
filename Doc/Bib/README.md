Here are a few explanations of the files in this directory, used
to create web pages for the GAP bibliography.

The source files are:

  GapCite.MR     just MR numbers, we will use MR to get full bibliographic info
  GapCite.notyet BiBTeX entries for papers that are not yet in MR but
                 likely will be in a few months
  GapNonMR.bib   BiBTeX entries for papers that will not be in MR (e.g. theses).
  NonVerif.MR    Things not yet verified, same format as GapCite.MR 
  NonVerif.NonMR Things not yet verified, same format as GapCite.notyet

From these `newmakegapbib' produces `gap-published.bib'. This requires
subscription to MathSciNet, which St Andrews has.
The advantage of this approach is that MathSciNet gives us the for free:
Good BiBTeX entries (no need to look up journal names or diacritic
characters) and MR numbers we can link to. It also makes it easier to add
entries as only the MR number is needed.

Finally gap itself called with `convbib.g' produces the web page and a nice
PDF bibliography from `gap-published.bib'. These are in 
`gap-published.html' and `gap-published.pdf' which are linked from the
main web page `bib.html'. In additions `statistics.generated' is created,
a statistics page used in `statistics.mixer' to create `statistics.html'.

Further helper files:
  gapbib.tex
  gap-head.bib

NOTE: 
`gap-published.html' and `gap-published.pdf' are *not* in CVS because
they can be generated automatically by convbib.g rather quickly.

NOTE2: 
Please do not forget to tag the latest version of `gap-published.bib' 
and `statistics.generated' after creation and check in with the PUB tag:

  cvs tag -F PUB gap-published.bib
  cvs tag -F PUB statistics.generated

Otherwise the nightly update script will revert to the old version.

July 8th 2004               Max Neunhoeffer
Revised in November 2010    Alexander Konovalov
