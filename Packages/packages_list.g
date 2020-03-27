# This script generate the source for lists of accepted and deposited packages
# Start from root of GAPWWW

data_libs:=["aclib","atlasrep","crystcat","ctbllib",
            "primgrp","transgrp","smallgrp","tomlib"];

projects := rec(

cap := SortedList(List([ "GeneralizedMorphismsForCAP", "LinearAlgebraForCAP",
"ModulePresentationsForCAP", "MonoidalCategories" ],LowercaseString)),

homalg := SortedList(List([ "4ti2Interface", "ExamplesForHomalg", "Gauss",
"GaussForHomalg", "GradedModules", "GradedRingForHomalg", "HomalgToCAS", 
"IO_ForHomalg", "LocalizeRingForHomalg", "MatricesForHomalg", "Modules", 
"NConvex", "RingsForHomalg", "SCO", "PolymakeInterface", "ToolsForHomalg",
"ToricVarieties" ],LowercaseString))

);

project_names:=RecNames( projects );
project_components:=SortedList(Concatenation( List( project_names, proj -> projects.(proj) ) ) );

PackageEntry:=function(pkg)
return Concatenation("{{site.data.packagelinks.PKG_OverviewLink_", pkg, "}}<br/>&nbsp;");
end;

streamFilename := Concatenation("Packages/PackageList/", "accepted.html");
stream := OutputTextFile(streamFilename, false);
SetPrintFormattingStatus(stream, false);

AppendTo(stream, "<ul>\n");
for pkg in SortedList(RecNames(GAPInfo.PackagesInfo)) do
  if GAPInfo.PackagesInfo.(pkg)[1].Status = "accepted" and not pkg in data_libs then
  AppendTo(stream, "  <li>", PackageEntry(pkg), "</li>\n");
  fi;
od;
AppendTo(stream, "</ul>\n");

CloseStream(stream);

streamFilename := Concatenation("Packages/PackageList/", "data_libraries.html");
stream := OutputTextFile(streamFilename, false);
SetPrintFormattingStatus(stream, false);

AppendTo(stream, "<ul>\n");
for pkg in SortedList(RecNames(GAPInfo.PackagesInfo)) do
  if pkg in data_libs then
  AppendTo(stream, "  <li>", PackageEntry(pkg), "</li>\n");
  fi;
od;
AppendTo(stream, "</ul>\n");

CloseStream(stream);

streamFilename := Concatenation("Packages/PackageList/", "deposited.html");
stream := OutputTextFile(streamFilename, false);
SetPrintFormattingStatus(stream, false);

AppendTo(stream, "<ul>\n");
for pkg in SortedList(RecNames(GAPInfo.PackagesInfo)) do
  if GAPInfo.PackagesInfo.(pkg)[1].Status <> "accepted" then
    if not (pkg in data_libs or pkg in project_components) then
      if pkg in project_names then
        AppendTo(stream, "  <li>", PackageEntry(pkg), "\n");
        AppendTo(stream, "      <ul>\n");
        for component in projects.(pkg) do
          AppendTo(stream, "       <li>", PackageEntry(component), "</li>\n");
        od;
        AppendTo(stream, "      </ul>\n");
        AppendTo(stream, "  </li>\n");
      else
        AppendTo(stream, "  <li>", PackageEntry(pkg), "</li>\n");
      fi;  
    fi;
  fi;  
od;
AppendTo(stream, "</ul>\n");

CloseStream(stream);

QUIT;

