#!/usr/local/bin/perl

require "cgi-lib.pl";

MAIN:
{

print &PrintHeader;

print "<BODY BGCOLOR=\"ffffff\">";

if (&ReadParse(*input))
{
 if ($input{'WORD'})
 {
  $word = $input{'WORD'};
  $forum = $input{'FORUM'};
  $oldforum = $input{'OLDFORUM'};
  $manual3 = $input{'MANUAL3'};
  $man4 = $input{'MAN4'};
  $web = $input{'WEB'};
  if ($input{'CONTEXT'})
   { $context = $input{'CONTEXT'}; }
  else
   { $context = "0" }
 }
 else
 {
   print "You have to give a word to search for !";
 }
 if (($word ne "")&&($forum||$oldforum||$manual3||$man4||$web)) 
 {
  print <<ENDOFHEAD;
<html>
<head>
<title>Search Results for $word</title>
</head>
<body>
<h1>Search Results for <i>$word</i></h1>
ENDOFHEAD
  if (!$context)
  {
   print <<ENDOFREPEATSEARCH
<hr>
<a href="search.cgi?$input&CONTEXT=1">Repeat this search with context displayed</a>
<br>
ENDOFREPEATSEARCH
  }

  ($searchwords = $word) =~ s/ and | or | not / /g;
  @searchwords = split(/ /, $searchwords);

  sub printlist
  {
   @files = split(/\n/, $_[0]);
   print "<ol>";
   foreach $file (@files)
   {

    if (($file !~ /^\#/)&&($file !~ /^search words:/)&&($file !~ /^\.$/))
    {
     @parts = split(/ /, $file);
     $score = $parts[0];
     $url = $parts[1];
     ($title = $file) =~ s/(.* ")(.*)(" .*)/\2/g;
     $size = $parts[3];
     print "<li><a href=$url>$title</a>\n";
     if ($context)
     {
      print "<br><font size=\"2\"><ul>";
      ($filecontents = $url) =~ s/http:\/\/www\.gap-system\.org\/\~history/\/home\/history\/public_html\//g;
      open(FILE, $filecontents);
      @filelines = <FILE>;
      $italic="0";
      foreach $line (@filelines)
      {
       if ($line =~ /<\s*a\s+name\s*=\s*\"[^\"]*\"[^>]*>/i)
       {
        ($anchor = $line) =~ s/.*<\s*a\s+name\s*=\s*\"([^\"]*)\"[^>]*>.*/\1/gi;
       }
       else
       {
        $anchor="nO aNchor";
       }
       ($line = $line) =~ s/(<img [^>]*alt\s*=\s*\")([^\"]*)(\"[^>]*>)/ \2 /gi;
       ($line = $line) =~ s/(\&)([aeiounyc])([a-z]+;)/\2/gi;
       ($line = $line) =~ s/<title>.*<\/title>//gi;
       ($line = $line) =~ s/<[^>]*>//g;
       ($line = $line) =~ s/(\.)(\S)/dECpOINT\2/g;
       @sentences = split(/\./, $line);
       foreach $sentence (@sentences)
       {
        ($sentence = $sentence) =~ s/dECpOINT/\./g;
        $flag = "0";
        foreach $searchword (@searchwords)
        {
         if ($searchword =~ /(\S+)(\*)/i)
         {
          $searchwordbeginning = $1;
          if ($sentence =~ /([^a-zA-Z]|^)($searchwordbeginning)(\S*)([^a-zA-Z]|$)/i)
          {
           $flag = "1";
           ($sentence = $sentence) =~ s/([^a-zA-Z]|^)($searchwordbeginning)(\S*)([^a-zA-Z]|$)/\1<b>\2\3<\/b>\4/gi;
          }
         }
         else
         {
          if ($sentence =~ /([^a-zA-Z]|^)($searchword)([^a-zA-Z]|$)/i)
          {
           $flag = "1";
           ($sentence = $sentence) =~ s/([^a-zA-Z]|^)($searchword)([^a-zA-Z]|$)/\1<b>\2<\/b>\3/gi;
          }
         }
        }
        if ($flag && $italic)
        {
         print "<li><i>$sentence\.</i> ";
         if ($anchor != "nO aNchor") { print "<br><a href=\"$url\#$anchor\"><b>Go directly to this paragraph!</b></a>"; }
         print "<br>\n";
         $italic="0";
        }
        elsif ($flag)
        {
         print "<li>$sentence\. ";
         if ($anchor != "nO aNchor") { print "<br><a href=\"$url\#$anchor\"><b>Go directly to this paragraph!</b></a>"; }
         print "<br>\n";
         $italic="1";
        }
       }
      }
      print "</ul><\/font><p>";
     }
    }
   }
  }

  if ($forum)
  {
   $list = qx{ /usr/local/bin/swish -f ./forum.swish -w "$word" };

   if ($list !=~ /\serr: no results\s/)
   {
    print "<hr>";
    print "<h2>Forum</h2>";
    if ($list =~ /\serr:/)
    {
      print "<p>A word appears too often or not at all. Please adjust your search.</p>";
    }
    else
    {
    &printlist($list);
    print "</ol>";
    }
   }
  }

  if ($oldforum)
  {
   $list = qx{ /usr/local/bin/swish -f ./oldforum.swish -w "$word" };

   if ($list !=~ /\serr: no results\s/)
   {
    print "<hr>";
    print "<h2>Old Forum Archives</h2>";
    if ($list =~ /\serr:/)
    {
      print "<p>A word appears too often or not at all. Please adjust your search.</p>";
    }
    else
    {
    &printlist($list);
    print "</ol>";
    }
   }
  }

  if ($man4)
  {
   $list = qx{ /usr/local/bin/swish -f ./manual4.swish -w "$word" };

   if ($list !=~ /\serr: no results\s/)
   {
    print "<hr>";
    print "<h2>GAP 4 Manual</h2>";
    if ($list =~ /\serr:/)
    {
      print "<p>A word appears too often or not at all. Please adjust your search.</p>";
    }
    else
    {
    &printlist($list);
    print "</ol>";
    }
   }
  }

  if ($manual3)
  {
   $list = qx{ /usr/local/bin/swish -f ./manual3.swish -w "$word" };

   if ($list !=~ /\serr: no results\s/)
   {
    print "<hr>";
    print "<h2>GAP 3 Manual</h2>";
    if ($list =~ /\serr:/)
    {
      print "<p>A word appears too often or not at all. Please adjust your search.</p>";
    }
    else
    {
    &printlist($list);
    print "</ol>";
    }
   }
  }

  if ($web)
  {
   $list = qx{ /usr/local/bin/swish -f ./website.swish -w "$word" };

   if ($list !=~ /\serr: no results\s/)
   {
    print "<hr>";
    print "<h2>GAP Website</h2>";
    if ($list =~ /\serr:/)
    {
      print "<p>A word appears too often or not at all. Please adjust your search.</p>";
    }
    else
    {
    &printlist($list);
    print "</ol>";
    }
   }
  }
 }

 print <<ENDOFLINKS;
<p>
<hr>
<font size="1">This search was performed by Kevin Hughes' \
<a href="http://www.eit.com/software/swish/">SWISH</a></font><br>
ENDOFLINKS
}
else
{
 print <<ENDOFSEARCHFORM;
<html><head><title>Search the Archive</title></head><body>
<h1>Search the GAP Web site</h1>
<hr>
Check the boxes to search that area of the archive.<br>
You can see the sentence(s) the search words appear in by checking the <tt>Display Context</tt> box below.<br> <b>Note</b>
that displaying the context can give quite lengthy output for more common search words.<br>
<form action="search.cgi">
<pre>
<input type="checkbox" name="FORUM" value="1" checked> Forum Archives
<input type="checkbox" name="OLDFORUM" value="1"> Forum Archives pre-2004
<input type="checkbox" name="MAN4" value="1" checked> Gap 4 Manual
<input type="checkbox" name="MANUAL3" value="1"> Gap 3 Manual
<input type="checkbox" name="WEB" value="1"> Website
</pre>
Enter Search Keyword: <input name="WORD"><br>
<pre><input type="checkbox" name="CONTEXT" value="1"> Display context
</pre>
<input type="submit" value="Search Archive"> <input type="reset" value="Clear Selection">
</form>
<h3>Search Tips</h3>
<ul>
<li>If your search keyword has an accented letter, then just use the letter without the accent.<br>
<li>The search will look for files with all your search words in unless you type
<tt>or</tt> between them.
<li>You can look for prefixes by adding a '<tt>*</tt>' at the end. e.g.
<tt>grou*</tt> will find <b>group, groups, groupring</b>, etc.
<li>When <tt>Display Context</tt> is checked, some of the sentences that appear
may end with a link saying <b>Go directly to this paragraph</b>.
These links will take you straight to the paragraph that the sentence is in.
</ul>

<hr>
<font size="1">This search uses Kevin Hughes'
<a href="http://www.eit.com/software/swish/">SWISH</a> and builds on the form
written by Ben Soares for the MacTutor history pages</font><br>
</body>
</html>
ENDOFSEARCHFORM

}
}

