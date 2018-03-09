##  
#A  convbib.g                                                Frank Lübeck
##  
##  A conversion tool to produce from the bib-files an html version and a
##  pdf-version for the web-pages, using GAPDoc.
##  
##  Add handling of further  bib-files at the end.
##  
LoadPackage("GAPDoc");

Read("MSC2010.g");

StatisticsByMSC:=function()
local ourbib, duplicates, q, w, tab, msccodes, mscnames, 
      b, nr, pos, posnomsc, prim, sec, i, total;
Print( "Reading the GAP bibliography ... \n" );
ourbib:=ParseBibFiles("gap-published.bib")[1];;
Print( "Checking for multiple labels ... \n");
duplicates := Filtered( Collected( List( ourbib, q->q.Label) ), w -> w[2]>1 );
if Length(duplicates) > 0 then
  Print("The following labels are defined more than once ", 
        List( duplicates, w -> w[1] ), "\n");
fi;
Print( "Loaded ", Length(ourbib), " records from GAP bibliography\n");
tab:=[];
msccodes:=List(MSC2010, w -> w[1]);
mscnames:=List(MSC2010, w -> w[2]);
SortParallel( msccodes, mscnames);
posnomsc := Position( msccodes, "XX" );
for i in [1..Length(msccodes)] do
  tab[i] := [ 0, 0, msccodes[i], mscnames[i] ];
od;
for b in ourbib do
  if IsBound(b.mrclass) then
    nr := b.mrclass;
    prim := nr{[1..2]};
    pos := Position( msccodes, prim ); 
    if pos <> fail then
      tab[pos][1]:=tab[pos][1]+1;
      pos := PositionSublist( nr, " (" );
      if pos <> fail then
        sec := SplitString( nr{[pos+2..Length(nr)]}, " ", " )");
        sec := Set( List( sec, q -> q{[1..2]} ) );
        for q in sec do 
          if q <> prim then
            pos := Position( msccodes, q ); 
            tab[pos][2]:=tab[pos][2]+1;
          fi;
        od;
      fi;  
    else  
      tab[posnomsc][1]:=tab[posnomsc][1]+1;
    fi;
  else
    tab[posnomsc][1]:=tab[posnomsc][1]+1;
  fi;  
od;
tab[posnomsc][2]:="";
tab[posnomsc][3]:="";
tab := Filtered( tab, w -> w[1]+w[2]>0 );
total := [ Sum( List( tab, w -> w[1] ) ), "", "", "TOTAL" ];
Add( tab, total );
return tab;
end;


bib2niceandhtml := function(name, header, subheader)
local i,ii,bib, fh, out, a, b, years, counts, pos, flag, mscreport;
  years:=[1987..2016];
  bib := ParseBibFiles("gap-head.bib", Concatenation(name, ".bib"));
  counts:=List(years,i->0);
  for a in bib[1] do 
    NormalizeNameAndKey(a);
    pos:=Position(years,Int(a.year));
    if pos<>fail then
      counts[pos]:=counts[pos]+1;
    elif Length(a.year)=7 and a.year[5]='/' then
      # year in format "2001/02"?
      pos:=Position(years,Int(a.year{[1,2,6,7]}));
      if pos<>fail then
        Print( a.Label, " : ", a.year, " --> ", a.year{[1,2,6,7]}, "\n" );
        counts[pos]:=counts[pos]+1;
      else
        Print("Warning: unrecognised year in ", a.Label, "\n");
      fi;
    else
      Print("Warning: no year is given in ", a.Label, "\n");
    fi;
    Unbind(a.authororig); Unbind(a.editororig); Unbind(a.keylong);
  od;
  Sort(bib[1], function(a,b) 
    return SIMPLE_STRING(a.author)<SIMPLE_STRING(b.author);
  end);
  WriteBibFile(Concatenation(name, "nicer.bib"),[bib[1],[],[]]);
  fh := function() 
    local a; 
    Print("<html>\n",
    "<meta http-equiv=\"Content-Type\" content=\"text/html;", 
    " charset=iso-8859-1\">\n\n",
    "<body bgcolor=\"#FFFFFF\">\n<br>\n<h1 align=\"center\">",
    header,
    "</h1>",
    subheader,
    "\n\n");
    for a in bib[1] do 
      b := ShallowCopy(a);
      b.title:=Filtered(b.title,x-> not x in "{}");
      PrintBibAsHTML(b); 
      Print("<pre>\n");
      PrintBibAsBib(a);
      Print("\n</pre>\n\n");
    od;
    Print("\n\n</body>\n</html>\n");
  end;
  out := OutputTextFile(Concatenation(name, ".html"), false);
  SetPrintFormattingStatus(out, false);
  PrintTo1(out, fh);
  CloseStream(out);
  PrintTo("statistics.generated",
  "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n<mixer>\n");
  for ii in [1,11..QuoInt(Length(years)-1,10)*10+1] do
    AppendTo("statistics.generated","<table>\n <colgroup>\n");
    for i in [1..10] do
      AppendTo("statistics.generated","  <col width=\"9%\"></col>\n");
    od;
    AppendTo("statistics.generated"," </colgroup>\n <tr><td>Year</td>\n");
    flag:=true;
    for i in years{[ii..Minimum(Length(years),ii+9)]} do
      if flag then
	AppendTo("statistics.generated","<td class=\"green\">",i,"</td>\n");
      else
	AppendTo("statistics.generated","<td align=\"right\">",i,"</td>\n");
      fi;
      flag:=not flag;
    od;
    AppendTo("statistics.generated","</tr>\n<tr><td>Number</td>\n");
    flag:=true;
    for i in counts{[ii..Minimum(Length(years),ii+9)]} do
      if flag then
	AppendTo("statistics.generated","<td class=\"green\">",i,"</td>\n");
      else
	AppendTo("statistics.generated","<td align=\"right\">",i,"</td>\n");
      fi;
      flag:=not flag;
    od;
    AppendTo("statistics.generated","</tr>\n</table><br />");
  od;
  pos:=Length(bib[1])-Sum(counts);
  if pos<>0 then
    AppendTo("statistics.generated","<p>No year given, or year out of bounds: ",pos,"</p>\n");
  fi;
  AppendTo("statistics.generated","</mixer>\n");
  
  mscreport:=StatisticsByMSC();
  PrintTo("statistics.mscreport",
  "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n<mixer>\n");
  AppendTo("statistics.mscreport","<table>\n <colgroup>\n");
  AppendTo("statistics.mscreport","  <col width=\"10%\"></col>\n");
  AppendTo("statistics.mscreport","  <col width=\"10%\"></col>\n");
  AppendTo("statistics.mscreport","  <col width=\"5%\"></col>\n");
  AppendTo("statistics.mscreport","  <col width=\"70%\"></col>\n");
  AppendTo("statistics.mscreport"," </colgroup>\n");
  AppendTo("statistics.mscreport","<tr>\n");
  AppendTo("statistics.mscreport","  <td align=\"right\">Primary</td>\n");
  AppendTo("statistics.mscreport","  <td align=\"right\">Secondary</td>\n");
  AppendTo("statistics.mscreport","  <td></td>\n");
  AppendTo("statistics.mscreport","  <td></td>\n");
  AppendTo("statistics.mscreport","</tr>\n");
  for i in [1..Length(mscreport)] do
    AppendTo("statistics.mscreport","<tr>\n");
 	AppendTo("statistics.mscreport","  <td align=\"right\">", mscreport[i][1],"</td>\n");
 	AppendTo("statistics.mscreport","  <td align=\"right\">", mscreport[i][2],"</td>\n");
 	AppendTo("statistics.mscreport","  <td></td>\n");
 	AppendTo("statistics.mscreport","  <td align=\"left\">\n", mscreport[i][4],"</td>\n");
    AppendTo("statistics.mscreport","</tr>\n");
  od;  
  AppendTo("statistics.mscreport","</table><br/>");
  AppendTo("statistics.mscreport","</mixer>\n");
  
  # changed to `plain' bibliography style. (This makes counting easier and
  # sorts according to the names, not the alpha abbreviations.)
  # ahulpke, 9/6/01
  PrintTo("FLtmpTeX.tex",
"\\documentclass[11pt]{article}\n",
"\\usepackage{amsfonts,url,fullpage,mathscinet}\n",
"\\def\\Bbb{\\mathbb}\n",
"\\def\\bold{\\boldmath}\n",
"\\def\\cprime{$'$}\n",
"\\def\\ssf{\\sf}\n",
"\\def\\refcno{see }\n",
"\\def\\text{\\mathrm}\n",
"\\def\\Dbar{\\leavevmode\\lower.6ex\\hbox to 0pt{\\hskip-.23ex \\accent\"16\\hss}D}\n",
"\\def\\refmr{}\\def\\endrefmr{}\n",
"\n",
"\\begin{document}\n",
"This list contains citations of the {\\sf GAP} system in scientific works.\n",
"It has been obtained from author's notices and searches in scientific citation databases\n",
"including {\\sf MathSciNet}, for which we acknowledge the American Mathematical Society.\n",
"\\vspace{15pt}\n",
"\\nocite{*}\n",
"\\begin{center}\n",
"\\textbf{\\Large ",header,"}\n",
"\\end{center}\n",
"\\def\\refname{}\n",
"\\bibliographystyle{plain}\n",
"\\bibliography{gap-head,",name,"nicer","}\n",
"\\end{document}\n");
  Exec(Concatenation("pdflatex FLtmpTeX; bibtex FLtmpTeX; pdflatex FLtmpTeX;",
       " pdflatex FLtmpTeX; mv FLtmpTeX.pdf ",name,".pdf; rm -f FLtmpTeX.*"));
end;

# Add further lists here.
bib2niceandhtml("gap-published", "Published work which cites GAP",
Concatenation( "The GAP bibliography was partially obtained using the ",
"<a href=\"http://www.ams.org/mathscinet/\">MathSciNet</a> database. ",
"We acknowledge the <a href=\"http://www.ams.org/\">American Mathematical Society</a> ",
"for giving us such opportunity.") );
# GapNonMR is joined in gap-published - no need to duplicate (AH, 9/4/01)
#bib2niceandhtml("GapNonMR", "Work not in MR which cites GAP");

Exec("echo '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.' >> gap-publishednicer.bib");
Exec("echo '%The GAP bibliography was partially obtained using the MathSciNet database.' >> gap-publishednicer.bib");
Exec("echo '%We acknowledge the American Mathematical Society for giving us such opportunity.' >> gap-publishednicer.bib");
