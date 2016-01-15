#!/usr/local/bin/perl

# ****
#
# bibmarkup.pl v1.1
#
# (c) Andy Wood ... 1994, 1995
#
# Program that takes a bibtex file and adds html markup to it.
#
# The command line arguments are:  bibmarkup.pl <input> [<output>]
#
# If the output filename is omitted then the program will pipe the output
# to stdout. If the filenames are the same then the program will work in
# the expeced manner, leaving you with a backup '~' file.
#
# The input file should be a valid BibTeX database (.bib) or a version
# with HTML markup (.html), like the output of this program. The output
# file will be a file that is both a valid BibTeX database and HTML
# document.
#
# By naming it file.html for your http server and creating a link to it
# called file.bib for BibTeX, you can use the *same* file for both jobs.
# You can also provide searches on it using bibsearch.pl.
#
# Andy...
# __
#
# Andy Wood : amw@cs.bham.ac.uk               The University of Birmingham
#             tel: +44 (0)21 414 3736           School of Computer Science
#             fax: +44 (0)21 414 4281                Edgbaston, Birmingham
#             http://www.cs.bham.ac.uk/~amw/              B15 2TT  England
#
# ****

# ****
#
# Modifications
#
# v1.1 - added basic support for @strings (handles and ignores them)
#      - add 'Format' comment for easy search access to markup formatting
#
# ****


# ****
#
# MarkupEntry
#
# Create a line of HTML for each entry in the file. This pulls the
# title and the author (or editor) from the BibTeX entry in $_, and
# prints a HTML heading, followed by an availablity list of urls if
# there are any, followed by the full entry in <PRE>formatted form.
#
# ****

sub MarkupEntry
  {
  if ( /\@string/i )
    {
    &MarkupStrings();
    }
  else
    {
    local( $junk, $bibtex ) = split( '@', $_, 2 );
    $bibtex = '@'.$bibtex;
    local( $key, $rest ) = split( ',', $bibtex, 2 );
    $key =~ s/^@.*[{(]\s*(.*)\s*$/$1/;                     # Retrieve the key

    local( $author, $title );
    $title = &GetField( "title", $bibtex );

    if ( /author\s*=/i )
      {
      $author = &GetField( "author", $bibtex );
      }
    elsif ( /editor\s*=/i )
      {
      $author = &GetField( "editor", $bibtex );
      if ( $author =~ /\band\b/ )
        {
        $author .= " (Eds)";
        }
      else
        {
        $author .= " (Ed)";
        }
      }
    else
      {
      $author = "";
      }
               
    # **** Format of line showing author and title information
    print "\n<A NAME=\"$key\"><B>$title</B>, <I>$author</I>\n";

    if ( /url\s*=/i )
      {
      local( $urls ) = &MarkupURL( &GetField( "url", $bibtex ) );

      # **** Format of line showing online availability
      print "<BR>Available as $urls.\n";
      }

    s/<PRE>//i;
    s/<\/PRE>//i;
    print "<PRE>\n", $bibtex, "</PRE>\n";
    }
  }


# ****
#
# MarkupURL
#
# Takes a list of URLs seperated by commas and expands them into a html list
# that you can click on.
#
# ****

sub MarkupURL
  {
  local( $url, $format, $html ) = "";
  local( @urls ) = split( ',', $_[0] );

  foreach $url ( 0..$#urls )
    {
    $html .= "\nand" if ( $url == $#urls && $#urls >= 1 );
    $html .= "," if ( $url >= 1 && $url < $#urls );

    $format = "";

    if ( $urls[ $url ] =~ /\.Z/ ||  $urls[ $url ] =~ /\.gz/ )
      {
      $format = "compressed ";
      }

    if ( $urls[ $url ] =~ /\.ps/i )
      {
      $format .= "postscript";
      }
    elsif ( $urls[ $url ] =~ /\.txt/i )
      {
      $format .= "text";
      }
    elsif ( $urls[ $url ] =~ /\.gif/i )
      {
      $format .= "gif";
      }
    elsif ( $urls[ $url ] =~ /\.html/i )
      {
      $format .= "hypertext";
      }
    else
      {
      $format = $urls[ $url ];
      $format =~ s/.*\/([^\/]*)$/$1/;
      }
         
    $urls[ $url ] =~ s/^\s+//;
    $html .= "\n<A HREF=\"".$urls[ $url ]."\">".$format."</A>";
    }

  return $html;
  }
   

# ****
#
# MarkupStrings
#
# Deal with @strings in $_. Currently just print them out.
# 
# This function needs to be developed! (e.g. read strings into associative
# array and use them when marking up references in html)
#
# ****

sub MarkupStrings
  {
  print "<PRE>\n\n", $_, "</PRE>\n";
  }
  

# ****
#
# GetField
#
# Gets the field specified in the first argument and strips it of quotes and/or
# squiggly brackets, removes excess spaces and returns it.
#
# ****

sub GetField
  {
  local( $field, $contents ) = @_;                   # Arguments: field name, bibtex entry

  $contents =~ s/\n/ /g;                             # Remove all \n's

  if ( $contents =~ /.*\b($field)\s*=\s*"([^"]*)"\s*,/i )
    {
    $contents = $2;
    }
  elsif ( $contents =~ /.*\b($field)\s*=\s*{(.*)}\s*,/i )
    {
    $contents = $2;                                  # Contains remaining fields too
    $contents =~ s/}\s*,.*//g;                       # So remove everything after },
    }
  elsif ( $contents =~ /.*\b($field)\s*=\s*(\d*)\s,/i )
    {
    $contents = $2;
    }
  else
    {
    $contents = "";
    }

  $contents =~ s/"|{|}//g;                           # Remove ""`s and {}'s
  $contents =~ s/\s+/ /g;                            # Make lots of spaces into 1.

  return $contents;
  }


# ****
#
# Main part of the code
#
# ****

$* = 1;

open( BIB, $ARGV[0] ) || die "Couldn't open input file\n";

if ( $ARGV[1] ne "" )
  {
  if ( $ARGV[1] ne $ARGV[0] )
    {
    open( HTML, ">".$ARGV[1] ) || die "Couldn't open output file\n";
    }
  else
    {
    open( HTML, ">".$ARGV[1].".tmp" ) || die "Couldn't open temporary file\n";
    }
  select( HTML );
  }

if ( $ARGV[0] =~ /\.bib$/ )
  {
  $stage='body';
  $/ = "";
  print "<!--BibTeX Starts-->\n";
  }
else
  {
  $stage='header';
  }

while ( <BIB> )
  {
  if ( $stage eq 'footer' )
    {
    print;
    }

  if ( $stage eq 'body' )
    {
    if ( /@.*{/ )      # If bibtex entry
      {
      &MarkupEntry();
      }

    if ( /<!--BibTeX Ends-->/i )   # If end of entries
      {
      print "\n", $_;
      $stage='footer';
      $/ = "\n";
      }
    }

  if ( $stage eq 'header' )
    {
    print;
    if ( /<!--BibTeX Starts-->/i )     # If start of entries
      {
      $stage='body';
      $/ = "";
      }
    }
  }

print "\n<!--BibTeX Ends-->\n" if ( $ARGV[0] =~ /\.bib$/ );

if ( $ARGV[0] eq $ARGV[1] )
  {
  rename( $ARGV[0], $ARGV[0]."~" );
  rename( $ARGV[1].".tmp", $ARGV[1] );
  }

exit;




