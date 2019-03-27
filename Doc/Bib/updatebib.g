Read("GapIgnore.MR");

SEARCHMRHOST := "www.ams.org";

EntryForGapCiteMR:=function( bib )
#
# This function takes the string 'bib' representing a bibtex record retrieved
# from MathSciNet and prints it as two lines to be added to GapCite.MR
# The 1st line is a textual description (1stAuthorSurname:Title).
# The 2nd line is the MR number (indented by space, without initial "MR")
#
local author, title, nr, limit, pos, i, s;
bib := HeuristicTranslationsLaTeX2XML.Apply(bib);
bib := ParseBibStrings(bib)[1][1];
# Surname of the 1st author
author := bib.author;
author:=author{[1..Position(author,',')-1]};
# MR number
nr := bib.mrnumber;
pos := PositionSublist( nr, " (" );
if pos <> fail then
  nr := nr{[1..pos-1]};
fi;
if nr{[1..2]}="MR" then
  nr := nr{[3..Length(nr)]};
fi; 
# Title (truncated, if too long)
title := bib.title;
NormalizeWhitespace(title);
limit:=70-Length(author);
if Length(title) > limit then
  pos := Number( title{[1..limit]}, i->i=' ' );
  pos := PositionNthOccurrence( title{[1..limit]}, ' ', pos );
  if pos <> fail then
      title := title{[1 .. pos-1]};
      Append( title, " ..." ); 
  fi;    
else
  Add( title, '.' );
fi;
# Finally, compose the resulting string
s:=Concatenation( author, " : ", title, "\n   ", nr, "\n\n" );
return s;
end;


MRNumbersFromMathSciNet:=function( searchmode, searchstrings, years )
#
# searchmode supported by GAPDoc could be one of: Author, AuthorRelated, 
# Title, ReviewText, Journal, InstitutionCode, Series, MSCPrimSec, 
# MSCPrimary, MRNumber, Anywhere, References and Year. Currently we allow
# only ReviewText, Anywhere and References.
# 
# Retrieves from MathSciNet MR numbers of publications whose citations 
# contains at least one string from the list 'searchstrings' for each 
# year from the range given in the 2nd argument 'years'.
# 
# Since the number of entries returned by MathSciNet is limited to 100,
# for years with 100 and more citations it splits request in multiple
# requests parametrised by the first letter of the author's surname.
#
local modes, letters, allmrno, year, r, bib, mrno, b, letter, str;
modes := [ "ReviewText", "Anywhere", "References" ];
if not searchmode in modes then
  Error( "MRNumbersFromMathSciNet: the first argument should be one of \n",
  modes, "\nand not ", searchmode, "\n");
fi;
Print("Retrieving BibTex data from MathSciNet: \n",
      searchmode, " containing ", searchstrings, "\n",
      "Years range : ", years, "\n");
letters := [ "A","B","C","D","E","F","G","H","I","J","K","L","M",
             "N","O","P","Q","R","S","T","U","V","W","X","Y","Z" ];
allmrno:=[];
for year in years do
  mrno:=[];
  for str in searchstrings do
    r:=SearchMR( rec( (searchmode):=str, Year:=String(year) ) );
    if Length(r)<100 then
      bib:=ParseBibStrings(Concatenation(r))[1];
      UniteSet( mrno, List(bib, b -> b.Label ) );
    else
      for letter in letters do
        Print( year, ":", letter, "\r");
        r := SearchMR( rec( Author:=Concatenation(letter,"*"), (searchmode):=str, Year:=String(year) ) );
        bib:=ParseBibStrings(Concatenation(r))[1];
        UniteSet( mrno, List(bib, b -> b.Label ) );
      od;
    fi;
  od;
  Print( year, " : ", Length(mrno), " entries \n");
  UniteSet( allmrno, mrno );
od;
allmrno := Set(allmrno);
for b in [1..Length(allmrno)] do
  mrno := allmrno[b];
  if mrno{[1..2]}="MR" then
    allmrno[b] :=mrno{[3..Length(mrno)]}; 
  else
    Error("MR number does not start with MR!\n");
  fi;
od;
Print("Discovered ", Length (allmrno), " entries in MathSciNet: \n",
      searchmode, " containing ", searchstrings, "\n",
      "Years range : ", years, "\n");
return allmrno;
end;


SearchMathSciNetForUpdates:=function( )
local ourbib, duplicates, q, w, ourmrno, b, nr, pos, mathrev;
Print( "Reading the GAP bibliography ... \n" );
ourbib:=ParseBibFiles("gap-published.bib")[1];;
Print( "Checking for multiple labels ... \n");
duplicates := Filtered( Collected( List( ourbib, q->q.Label) ), w -> w[2]>1 );
if Length(duplicates) > 0 then
  Print("The following labels are defined more than once ", 
        List( duplicates, w -> w[1] ), "\n");
fi;
Print( "Loaded ", Length(ourbib), " records from GAP bibliography\n");
ourmrno:=[]; 
for b in ourbib do
  if IsBound(b.mrnumber) then
    nr := b.mrnumber;
    pos := PositionSublist( nr, " (" );
    if pos <> fail then
      nr := nr{[1..pos-1]};
    fi;
    if nr{[1..2]}="MR" then
      nr := nr{[3..Length(nr)]};
    fi; 
    Add( ourmrno, nr );
  fi;  
od;
mathrev := Union( 
  MRNumbersFromMathSciNet( "ReviewText", 
    [ "www.gap", "gap-system.org", "GAP system", "GAP manual", "GAP4", "GAP3" ], 
    [ 1986 .. 2019 ] ),
  MRNumbersFromMathSciNet( "References", 
    [ "GAP system", "GAP manual", "GAP4", "GAP3" ], 
    [ 1986 .. 2019 ] )
  );  
return Filtered( mathrev, w -> (not w in ourmrno) and (not w in GAPIgnoreMRnumbers) );
end;


CheckMathSciNetForUpdates:=function()
#
# The function retrieves all MathSciNet entries citing "www.gap" from 
# 1986 till 2019.
#
# We use "www.gap" in references to cover our old and new website addresses.
# This covers the majority of GAP citations. There might be several other 
# non-standard references, without website address or referring to the GAP
# manual. They mainly refer to early years and can be enumerated by hands.
#
# Upon retrieving, this functions compares MR numbers from MathSciNet with 
# known and suggested MR numbers for GAP citations database.
#
local mathrev, ourbib, duplicates, ourmrno, ourlabel, b, nr, pos, searchres,
entry, suggestions, bib, newmrno, newlist, context, w;
mathrev := MRNumbersFromMathSciNet( "References", [ "www.gap", "gap-system.org" ], [ 1986 .. 2019 ] );
Print( "Reading the GAP bibliography ... \n" );
ourbib:=ParseBibFiles("gap-published.bib")[1];;
Print( "Checking for multiple labels ... \n");
duplicates := Filtered( Collected( List( ourbib, q->q.Label) ), w -> w[2]>1 );
if Length(duplicates) > 0 then
  Print("The following labels are defined more than once ", 
        List( duplicates, w -> w[1] ), "\n");
fi;
Print( "Loaded ", Length(ourbib), " records from GAP bibliography\n");
ourmrno:=[]; 
ourlabel:=[];
# First split known MR from not known
for b in ourbib do
  # MR number is already in our database - just add MR number to ourmrno
  if IsBound(b.mrnumber) then
    nr := b.mrnumber;
    pos := PositionSublist( nr, " (" );
    if pos <> fail then
      nr := nr{[1..pos-1]};
    fi;
    if nr{[1..2]}="MR" then
      nr := nr{[3..Length(nr)]};
    fi; 
    Add( ourmrno, nr );
  else  
    # store the whole record for further check 
    Add ( ourlabel, b );
  fi;  
od;
Print( "Known MR number   : ", Length(ourmrno), " publications\n",
       "Without MR number : ", Length(ourlabel), " publications\n");
Print( "Searching possible updated for entries without MR number ...\n");
Print( "Saving suggestions to the file 'suggested.txt' ... \n" );      
suggestions := []; 
PrintTo("suggested.txt", "Autogenerated by GAP\n");       
for b in ourlabel do
  searchres := SearchMRBib( b );
  if Length(searchres) > 1 then
    Print( "\n", b.Label, " --> \c" );
    AppendTo( "suggested.txt", 
              "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n\n", 
              b.Label, "\n\n", b, 
              "\n\nmay correspond to one of the following publication(s):\n\n");
    for entry in searchres do
      bib:=ParseBibStrings(entry);
      nr := bib[1][1].Label;
      if nr{[1..2]}="MR" then
        nr := nr{[3..Length(nr)]};
      fi;    
      AppendTo( "suggested.txt", "**********\n\n");
      if nr in ourmrno then
        Print( nr, "(known) " );     
        AppendTo( "suggested.txt", "already in the GAP bibliography\n\n");
      elif nr in mathrev then
        # This is a citation to be added anyway, but to list is just once, 
        # it will be reported in suggested.txt and not in tobeadded.txt
        Add (suggestions, nr );
        Print( nr, "(add) " );     
        AppendTo( "suggested.txt", "not contained in the GAP bibliography\n");
        AppendTo( "suggested.txt", "but citing GAP - should be added anyway\n\n");
      else
        Print( nr, "(check) " );     
        AppendTo( "suggested.txt", 
                  "not contained in the GAP bibliography - check before adding \n\n");
      fi;
      AppendTo( "suggested.txt", EntryForGapCiteMR(entry) );
      AppendTo( "suggested.txt", entry, "\n");
    od;  
    Print("\n");
  else
    Print(".\c");
  fi;  
od;
Print( "Completed saving suggestions to 'suggested.txt' ... \n" );      
newmrno := Difference( mathrev, Union( ourmrno, suggestions, GAPIgnoreMRnumbers ) );
Print( "Discovered ", Length(newmrno), " new GAP citations in MathSciNet \n" );
#
# Uncomment this if needed to save citations from MathSciNet in BibTeX 
#
# Print( "Saving new GAP citations the file 'tobeadded.bib' ... \n" );       
# PrintTo("tobeadded.bib", "Autogenerated by GAP\n");       
# for nr in new do   
#  Print( nr, "\n" );
#  AppendTo( "tobeadded.bib", "% ", nr, "\n" );
#  AppendTo( "tobeadded.bib", SearchMR( rec(MRNumber:=nr))[1], "\n\n" );
# od;  
newlist:=[];
Print( "Saving new GAP citations the file 'tobeadded.txt' ... \n" );       
PrintTo("tobeadded.txt", "Autogenerated by GAP\n");       
AppendTo("tobeadded.txt", "To include in WWW2/Doc/Bib/GapCite.MR\n");       
for nr in newmrno do   
  bib := SearchMR( rec(MRNumber:=nr) );
  context := SearchMR( rec(MRNumber:=nr, type:="html" ) );
  context:=SplitString(context,"\n");
  context:=Filtered(context, w -> PositionSublist(LowercaseString(w),"gap") <> fail);
  context:=List(context,NormalizedWhitespace);
  if Length(bib)>1 then
    Error( "More than one entry with number ", nr );
  fi;
  entry := EntryForGapCiteMR( bib[1] );
  for w in context do
    Append(entry, w);
    Append(entry, "\n");
  od;
  Append(entry,"\n-------------------------------------------------------\n");
  Print(entry);
  Add( newlist, entry );
od;
Sort( newlist );
for entry in newlist do
  AppendTo( "tobeadded.txt", entry );
od;  
Print("Check for updates completed! \n");
end;

CheckMathSciNetForUpdates();

