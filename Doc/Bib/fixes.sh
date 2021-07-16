#!/bin/sh
# This fixes some LaTeX irregularities in BibTeX entries retrieved from MathSciNet
# to ensure that `convbib.g` is able to compile the PDF version of the bibliography.
#

# four times since used in the same line
sed -i '' -e 's/{\\i}/{i}/' gap-published.bib
sed -i '' -e 's/{\\i}/{i}/' gap-published.bib
sed -i '' -e 's/{\\i}/{i}/' gap-published.bib
sed -i '' -e 's/{\\i}/{i}/' gap-published.bib

sed -i '' -e 's/Borz\\`\\i/Borz\\`i/' gap-published.bib

sed -i '' -e 's/{$q&gt;2$}/{$q > 2$}/' gap-published.bib
sed -i '' -e 's/{$p&gt;2$}/{$p > 2$}/' gap-published.bib
sed -i '' -e 's/{$3&lt;q&lt;100$}/{$3 < q < 100$}/' gap-published.bib
sed -i '' -e 's/{$\\roman {PSL}(2,7)$}/{${PSL}(2,7)$}/' gap-published.bib

sed -i '' -e 's/{$q \\geqslant 7$}/{$q \\geq 7$}/' gap-published.bib
sed -i '' -e 's/\\leqslant/\\leq/' gap-published.bib
sed -i '' -e 's/{$\\~A_2$}/{$\\tilde A_2$}/' gap-published.bib
sed -i '' -e 's/{$\\~C_2$}/{$\\tilde C_2$}/' gap-published.bib
sed -i '' -e 's/{$\\~A_2$}/{$\\tilde A_2$}/' gap-published.bib
sed -i '' -e 's/{$\\~C_2$}/{$\\tilde C_2$}/' gap-published.bib
sed -i '' -e 's/{\\cyr Sh}/{Sh}/' gap-published.bib

sed -i '' -e 's/Erd\\H{o}s/Erd{\\H{o}}s/' gap-published.bib
sed -i '' -e 's/{E}rd\\H{o}s/{E}rd{\\H{o}}s/' gap-published.bib
sed -i '' -e 's/G\\polhk asior/G\\polhk{a}sior/' gap-published.bib
