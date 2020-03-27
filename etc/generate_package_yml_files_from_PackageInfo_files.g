#
# GitHubPagesForGAP - a template for using GitHub Pages within GAP packages
#
# Copyright (c) 2013-2018 Max Horn
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
#

# Parse PackageInfo.g and regenerate _data/package.yml from it.

Basename := function(str)
  local len;
  len := Length(str);
  while len > 0 and str[len] <> '/' do
    len := len - 1;
  od;
  if len = 0 then
    return str;
  else
    return str{[len+1..Length(str)]};
  fi;
end;

PrintPeopleList := function(stream, people)
    local p;
    for p in people do
        AppendTo(stream, "    - name: ", p.FirstNames, " ", p.LastName, "\n");
        if IsBound(p.WWWHome) then
            AppendTo(stream, "      url: ", p.WWWHome, "\n");
        elif IsBound(p.Email) then
            AppendTo(stream, "      url: mailto:", p.Email, "\n");
        else
            AppendTo(stream, "      url: \n");
        fi;
    od;
    AppendTo(stream, "\n");
end;

PrintPackageList := function(stream, pkgs)
    local p, pkginfo;
    for p in pkgs do
        AppendTo(stream, "    - name: \"", p[1], "\"\n");
        AppendTo(stream, "      version: \"", p[2], "\"\n");
        pkginfo := PackageInfo(p[1]);
        if Length(pkginfo) > 0 and IsBound(pkginfo[1].PackageWWWHome) then
            AppendTo(stream, "      url: \"", pkginfo[1].PackageWWWHome, "\"\n");
        fi;
    od;
    AppendTo(stream, "\n");
end;

PrintExternalConditionsList := function(stream, ext)
    local e;
    for e in ext do
        if IsString(e) then
            AppendTo(stream, "    - name: \"", e, "\"\n");
            AppendTo(stream, "      url: \n");
        else
            AppendTo(stream, "    - name: \"", e[1], "\"\n");
            AppendTo(stream, "      url: \"", e[2], "\"\n");
        fi;
    od;
    AppendTo(stream, "\n");
end;

# verify date is of the form YYYY-MM-DD
IsValidISO8601Date := function(date)
    local day, month, year;
    if Length(date) <> 10 then return false; fi;
    if date[5] <> '-' or date[8] <> '-' then return false; fi;
    if not ForAll(date{[1,2,3,4,6,7,9,10]}, IsDigitChar) then
        return false;
    fi;
    date := List(SplitString(date, "-"), Int);
    day := date[3];
    month := date[2];
    year := date[1];
    return month in [1..12] and day in [1..DaysInMonth(month, year)];
end;

# path must be of the form "*dirname/PackageInfo.g"
GeneratePackageYML:=function(path)
    local pkg, dirname, streamFilename, stream, date, authors, maintainers,
        contributors, formats, f, tmp, bnam;

    Read(path);
    pkg := GAPInfo.PackageInfoCurrent;
    dirname := SplitString(path, "/");
    if Length(dirname) >= 2 then
        dirname := dirname[Length(dirname) - 1];
    else
        Error("invalid <path> argument");
    fi;


    # TODO change path to "_Packages/.." when done
    streamFilename := Concatenation("_Packages/",
                                    LowercaseString(pkg.PackageName), ".html");
    stream := OutputTextFile(streamFilename, false);
    SetPrintFormattingStatus(stream, false);

    AppendTo(stream, "---\n");
    AppendTo(stream, "name: ", pkg.PackageName, "\n");
    AppendTo(stream, "dirname: ", dirname, "\n");
    AppendTo(stream, "version: \"", pkg.Version, "\"\n");
    if IsBound(pkg.License) then
        AppendTo(stream, "license: \"", pkg.License, "\"\n");
    else
        AppendTo(stream, "license: \n");
    fi;

    # convert date from DD/MM/YYYY to ISO 8601, i.e. YYYY-MM-DD
    #
    # in the future, GAP might support ISO 8601 dates in PackageInfo.g,
    # so be prepared to accept that
    date := pkg.Date;
    tmp := SplitString(pkg.Date, "/");
    if Length(tmp) = 3 then
        # pad month and date if necessary
        if Length(tmp[1]) = 1 then
          tmp[1] := Concatenation("0", tmp[1]);
        fi;
        if Length(tmp[2]) = 1 then
          tmp[2] := Concatenation("0", tmp[2]);
        fi;
        date := Concatenation(tmp[3], "-", tmp[2], "-", tmp[1]);
    fi;
    if not IsValidISO8601Date(date) then
        Print("malformed release date ", pkg.Date, " in ",
              pkg.PackageName, ".\n");
        AppendTo(stream, "date: 9999-01-01 \n");
    else
        AppendTo(stream, "date: ", date, "\n");
    fi;

    AppendTo(stream, "description: |\n");
    AppendTo(stream, "    ", pkg.Subtitle, "\n");
    AppendTo(stream, "\n");

    authors := Filtered(pkg.Persons, p -> p.IsAuthor);
    if Length(authors) > 0 then
        AppendTo(stream, "authors:\n");
        PrintPeopleList(stream, authors);
    fi;

    maintainers := Filtered(pkg.Persons, p -> p.IsMaintainer);
    if Length(maintainers) > 0 then
        AppendTo(stream, "maintainers:\n");
        PrintPeopleList(stream, maintainers);
    fi;

    contributors := Filtered(pkg.Persons, p -> not p.IsMaintainer and not p.IsAuthor);
    if Length(contributors) > 0 then
        AppendTo(stream, "contributors:\n");
        PrintPeopleList(stream, contributors);
    fi;

    if IsBound(pkg.Dependencies.GAP) then
        AppendTo(stream, "GAP: \"", pkg.Dependencies.GAP, "\"\n\n");
    else
        AppendTo(stream, "GAP: \n");
    fi;

    if IsBound(pkg.Dependencies.NeededOtherPackages) and
        Length(pkg.Dependencies.NeededOtherPackages) > 0 then
        AppendTo(stream, "needed-pkgs:\n");
        PrintPackageList(stream, pkg.Dependencies.NeededOtherPackages);
    else
        AppendTo(stream, "needed-pkgs: \n");
    fi;

    if IsBound(pkg.Dependencies.SuggestedOtherPackages) and
        Length(pkg.Dependencies.SuggestedOtherPackages) > 0 then
        AppendTo(stream, "suggested-pkgs:\n");
        PrintPackageList(stream, pkg.Dependencies.SuggestedOtherPackages);
    else
        AppendTo(stream, "suggested-pkgs: \n");
    fi;

    if IsBound(pkg.Dependencies.ExternalConditions) and
        Length(pkg.Dependencies.ExternalConditions) > 0 then
        AppendTo(stream, "external:\n");
        PrintExternalConditionsList(stream, pkg.Dependencies.ExternalConditions);
    else
        AppendTo(stream, "external: \n");
    fi;

    AppendTo(stream, "www: ", pkg.PackageWWWHome, "\n");
    # Workaround for Issue ..
    # If README_URL is the empty string, then tmp will be an empty list.
    if not IsEmpty(pkg.README_URL) then
        tmp := SplitString(pkg.README_URL,"/");
        tmp := tmp[Length(tmp)];  # extract README filename (typically "README" or "README.md")
        AppendTo(stream, "readme: ", tmp, "\n");
    fi;
    AppendTo(stream, "packageinfo: ", pkg.PackageInfoURL, "\n");
    if IsBound(pkg.GithubWWW) then
        AppendTo(stream, "github: ", pkg.GithubWWW, "\n");
    else
        AppendTo(stream, "github: \n");
    fi;
    AppendTo(stream, "\n");
    
    formats := SplitString(pkg.ArchiveFormats, " ");
    if Length(formats) > 0 then
        AppendTo(stream, "downloads:\n");
        for f in formats do
            AppendTo(stream, "    - name: ", f, "\n");
            AppendTo(stream, "      url: ", pkg.ArchiveURL, f, "\n");
        od;
        AppendTo(stream, "\n");
    fi;

    # directory name of unpacked archive
    bnam := Basename(pkg.ArchiveURL);
    # if the package provides archives named 'version.format',
    # we rename them to 'packagename-version.format'
    if bnam[1] in "0123456789" then
        bnam:=Concatenation( pkg.PackageName, "-", bnam );
    fi;  
    AppendTo(stream, "base-archive-name: ", bnam, "\n");

    AppendTo(stream, "abstract: |\n");
    for tmp in SplitString(pkg.AbstractHTML,"\n") do
        AppendTo(stream, "    ", tmp, "\n");
    od;
    AppendTo(stream, "\n");

    AppendTo(stream, "status: ", pkg.Status, "\n");
    
    if IsBound(pkg.CommunicatedBy) then
        AppendTo(stream, "communicated-by: \"", pkg.CommunicatedBy, "\"\n\n");
    else
        AppendTo(stream, "communicated-by: \n");
    fi;

    if IsBound(pkg.AcceptDate) then
        AppendTo(stream, "accept-date: \"", pkg.AcceptDate, "\"\n\n");
    else
        AppendTo(stream, "accept-date: \n");
    fi;

    if IsBound(pkg.SourceRepository) then
        AppendTo(stream, "source-repo:\n");
        AppendTo(stream, "    type: ", pkg.SourceRepository.Type, "\n");
        AppendTo(stream, "    url: ", pkg.SourceRepository.URL, "\n");
    else
        AppendTo(stream, "source-repo: \n");
    fi;

    if IsBound(pkg.IssueTrackerURL) then
        AppendTo(stream, "issue-url: \"", pkg.IssueTrackerURL, "\"\n\n");
    else
        AppendTo(stream, "issue-url: \n");
    fi;

    if IsBound(pkg.SupportEmail) then
        AppendTo(stream, "support-email: \"", pkg.SupportEmail, "\"\n\n");
    else
        AppendTo(stream, "support-email: \n");
    fi;

    if IsRecord(pkg.PackageDoc) then
        AppendTo(stream, "doc-html: ", pkg.PackageDoc.HTMLStart, "\n");
        AppendTo(stream, "doc-pdf: ", pkg.PackageDoc.PDFFile, "\n");
    else
        Assert(0, IsList(pkg.PackageDoc));
        AppendTo(stream, "doc-html: ", pkg.PackageDoc[1].HTMLStart, "\n");
        AppendTo(stream, "doc-pdf: ", pkg.PackageDoc[1].PDFFile, "\n");
        if Length(pkg.PackageDoc) > 1 then
            Print("Warning, this package has more than one help book!\n");
        fi;
    fi;

    if IsBound(pkg.Keywords) and
        Length(pkg.Keywords) > 0 then
        AppendTo(stream, "keywords: |\n");
        AppendTo(stream, "    ", JoinStringsWithSeparator(pkg.Keywords,", "),".\n");
    else
        AppendTo(stream, "keywords: \n");
    fi;

    AppendTo(stream, "citeas: |\n");
    for tmp in SplitString(StringBibXMLEntry(ParseBibXMLextString(BibEntry(pkg)).entries[1],"HTML"),"\n") do
        AppendTo(stream, "    ", tmp, "\n");
    od;
    AppendTo(stream, "\n");

    AppendTo(stream, "bibtex: |\n");
    for tmp in SplitString(StringBibXMLEntry(ParseBibXMLextString(BibEntry(pkg)).entries[1],"BibTeX"),"\n") do
        AppendTo(stream, "    ", tmp, "\n");
    od;
    AppendTo(stream, "---\n");

    CloseStream(stream);
end;

inputStream := InputTextFile(path);
pathsToPackageInfoFile := ReadAll(inputStream);
pathsToPackageInfoFile := SplitString(pathsToPackageInfoFile, "\n");
Print("\n");
for path in pathsToPackageInfoFile do
    NormalizeWhitespace(path);
    GeneratePackageYML(path);
od;
QUIT;
