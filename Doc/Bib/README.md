# The GAP bibliography

The GAP bibliography resides in the directory `GapWWW/Doc/Bib`.


## Data files

- `GapCite.MR`: this file contains just MR numbers of papers that cite
or refer to (one of the versions of) GAP (here and below "MR" stands
for "Mathematical Reviews".). The format is alternatingly one line of
the form 1stAuthorSurname Paper (not starting with a blank) and one
line MR-Number (starting with a blank). MR numbers will be used to get
full bibliographic info from MathSciNet, and the textual description
only helps when adding papers to the file (in particular, to keep
entries sorted by the first author).

- `GapCite.notyet`: BiBTeX entries for papers that are not yet in MR
but likely will be there in a few months.

- `GapIgnore.MR`: GAP file containing a list of strings corresponding
to MR numbers of papers that may be falsely reported by MathSciNet as
citing GAP (for example, if they refer to the History of Mathematics
Archive website wrongly stating its address in the GAP domain as may
be returned by some search systems).

- `GapNonMR.bib`: BiBTeX entries for papers that will not be in MR
(e.g. theses).

- `NonVerif.MR`: Things not yet verified, same format as GapCite.MR.

- `NonVerif.NonMR`: Things not yet verified, same format as `GapCite.notyet`


## Checking MathSciNet for new GAP citations

Steps described in this section require MathSciNet subscription and
should be performed from the computer having IP address agreed with
MathSciNet (arrangements made in St Andrews).


### Identifying new GAP citations in MathSciNet

To check MathSciNet for new GAP citations read `updatebib.g` into GAP.
Running `updatebib.g` will produce two files:

- `tobeadded.txt`: This file has the same format as `GapCite.MR` and
lists publications citing GAP which should be examined and after that
added either to `GapCite.MR` or to `GapIgnore.MR`.

- `suggested.txt`: This file contains suggestions to "move" certain
entries from `GapCite.notyet` and `GapNonMR.bib` to `GapCite.MR`.
All suggestions, including those which do not match the publication
listed in the GAP bibliography, should be carefully examined before
any changes.

Note that `updatebib.g` is not a complete solution for updating GAP
bibliography. It searches for occurrences of the substring `www.gap`
and `gap-system.org` in citations (this covers both old and current
addresses of the GAP website), but it does not cover publications
citing GAP without its website or referring to it only in the text;
finally, it covers only MathSciNet and does not look into other
bibliography databases. Therefore, manual search still should be used
to discover more GAP citations. The  `SearchMathSciNetForUpdates`
function from `updatebib.g` may be helpful in this direction since it
performs more broad search in the MathSciNet, dropping some more strict
limitations.

### Retrieving BibTeX entries for GAP citations from MathSciNet

After the source files of the GAP bibliography are updated, the script
`makegapbib` uses `GapCite.MR`, `GapCite.notyet` and `GapNonMR.bib`
to produce `gap-published.bib` (this requires subscription to MathSciNet,
which St Andrews has). The advantage of this approach is that MathSciNet
gives us good BiBTeX entries (no need to look up journal names or
diacritic characters) and their updates, and MR numbers we can link to.
It also makes it easier to add entries as only the MR number is needed.

At the end of its work `makegapbib` will also display error messages
reporting MR numbers whose BibTeX record it failed to fetch from
MathSciNet -- these should be investigated since they may point out on
some inconsistencies in our data.


## Updating GAP bibliography webpages

The next steps do not require MathSciNet subscription and can be
performed elsewhere.

Running `convbib.g` in GAP produces the following files, which are
linked from the main GAP bibliography web page `bib.html`:

- `gap-published.pdf`: a nice PDF bibliography from `gap-published.bib`
(using further helper files `gapbib.tex` and `gap-head.bib`).

- `gap-publishednicer.bib`: BibTeX source for the GAP bibliography.

- `gap-published.html`: HTML version of the GAP bibliography with
BibTeX entries.

- `_data/bib_stats_year.yml` and `_data/bib_stats_msc.yml`: data files
with the numbers of GAP citations by year and by MSC category.

The output of `convbib.g` should be also checked for errors and warnings
reporting repeated entries, incomplete BibTeX records (mostly may be
ignored), etc.

After that, running `bibsort.g` in GAP produces files in directories
`Doc/Bib/Year` and `Doc/Bib/MSC` containing lists of papers by the
year of publication and by MSC category.
