##  
##  A utility for dumping links to all available manual sections 
##  (for use with named manual references on web pages or in search
##  utilities).
##
##  This is meant to be used with a plain vanilla GAP release, with
##  only the bundled packages and no special user config.
##

WriteAllLinksOfAllHelpSections := function()
  local all, res, rootpath, entries, entry, path, book, a;

  #LoadAllPackages();
  
  all := [];

  # if path is not below first of the GAP root paths, we write FAIL for the
  # path
  rootpath := Last(GAPInfo.RootPaths);
  if Length(rootpath) = 0 or rootpath[Length(rootpath)] <> '/' then
    Add(rootpath, '/');
  fi;
  # load all books
  HELP(":?");
  for a in SortedList(NamesOfComponents(HELP_BOOKS_INFO)) do
    book := HELP_BOOKS_INFO.(a);
    entries := List([1..Length(book.entries)], x -> HELP_BOOK_HANDLER.HelpDataRef(book, x));
    for entry in entries do
      if IsString(entry[6]) and StartsWith(entry[6], rootpath) then
        path := entry[6]{[Length(rootpath)+1..Length(entry[6])]};
      else
        Print("Invalid HTML path: ", entry, "\n");
        path := "FAIL";
      fi;
      entry[1] := StripEscapeSequences(entry[1]);
      entry[1] := ReplacedString(entry[1], " (not loaded)", "");
      NormalizeWhitespace(entry[1]);
      path := ReplacedString( path, "_mj.html", ".html" );
      Add(all, [entry[1], path]);
    od;
  od;

  # Remove duplicates
  all := Set(all);

  # sort everything to ensure the output stays relatively stable
  SortBy(all, x -> [LowercaseString(x[1]), LowercaseString(x[2])]);

  # collect everything in a string
  res := "---\n";
  for entry in all do
    Append(res, "'");
    Append(res, ReplacedString( entry[1], "'", "''" ));
    Append(res, "': '");
    Append(res, entry[2]);
    Append(res, "'\n");
  od;
  FileString("_data/help.yml", res);
end;

WriteAllLinksOfAllHelpSections();
QUIT_GAP(0);
