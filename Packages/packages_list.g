# This script generate the source for lists of accepted and deposited packages
# Start GAP release with -r -A and read this file. Then paste the output into 
# `GapWWW/Packages/packages.mixer`.

data_libs:=["aclib","atlasrep","crystcat","ctbllib",
            "primgrp","transgrp","smallgrp","tomlib"];

projects := rec(

cap := SortedList(List([ "GeneralizedMorphismsForCAP", "LinearAlgebraForCAP",
"ModulePresentationsForCAP" ],LowercaseString)),

homalg := SortedList(List([ "ExamplesForHomalg", "GaussForHomalg", "GradedModules",
"GradedRingForHomalg", "HomalgToCAS", "IO_ForHomalg", "LocalizeRingForHomalg",
"MatricesForHomalg", "Modules", "RingsForHomalg", "SCO", "ToolsForHomalg",
"ToricVarieties" ],LowercaseString))

);

project_names:=RecNames( projects );
project_components:=SortedList(Concatenation( List( project_names, proj -> projects.(proj) ) ) );

PackageEntry:=function(pkg)
return Concatenation("<mixer parsevar=\"PKG_OverviewLink_", pkg, "\"/>");
end;

Print("\n\n<!-- Accepted packages -->\n");
Print("<ul>\n");
for pkg in SortedList(RecNames(GAPInfo.PackagesInfo)) do
  if GAPInfo.PackagesInfo.(pkg)[1].Status = "accepted" and not pkg in data_libs then
  Print("  <li>", PackageEntry(pkg), "</li>\n");
  fi;
od;
Print("</ul>\n");

Print("\n\n<!-- Data libraries -->\n");
Print("<ul>\n");
for pkg in SortedList(RecNames(GAPInfo.PackagesInfo)) do
  if pkg in data_libs then
  Print("  <li>", PackageEntry(pkg), "</li>\n");
  fi;
od;
Print("</ul>\n");

Print("\n\n<!-- Deposited packages -->\n");
Print("<ul>\n");
for pkg in SortedList(RecNames(GAPInfo.PackagesInfo)) do
  if GAPInfo.PackagesInfo.(pkg)[1].Status <> "accepted" then
    if not (pkg in data_libs or pkg in project_components) then
      if pkg in project_names then
        Print("  <li>", PackageEntry(pkg), "\n");
        Print("      <ul>\n");
        for component in projects.(pkg) do
          Print("       <li>", PackageEntry(component), "</li>\n");
        od;
        Print("      </ul>\n");
        Print("  </li>\n");
      else
        Print("  <li>", PackageEntry(pkg), "</li>\n");
      fi;  
    fi;
  fi;  
od;
Print("</ul>\n");
