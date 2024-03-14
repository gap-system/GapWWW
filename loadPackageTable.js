// function to format the data for the hidden menu that drops down with click
function format(d) {
    // create string with all involved persons that is nicely formatted
    const nPersons = d.Persons.length;
    var namesPersons = "";
    for(let i=0; i < nPersons; i++ ){
        namesPersons += d.Persons[i].FirstNames;
        namesPersons += " ";
        namesPersons += d.Persons[i].LastName;
        if(i==nPersons-2 && nPersons>=1){
            namesPersons += " and ";
        } else if(i!=nPersons-1){
            namesPersons += ", ";
        }
    }

    // create string of necessary other packages
    if(d.Dependencies.NeededOtherPackages != [] && typeof(d.Dependencies.NeededOtherPackages) != "undefined"){
        const nNeccPack = d.Dependencies.NeededOtherPackages.length;
        var neccPack = "";
        for(let i=0; i < nNeccPack; i++ ){
            neccPack += d.Dependencies.NeededOtherPackages[i][0];
            neccPack += ' (';
            neccPack += d.Dependencies.NeededOtherPackages[i][1];
            neccPack += ')'
            if(i==nNeccPack-2 && nNeccPack>=1){
                neccPack += " and ";
            } else if(i!=nNeccPack-1){
                neccPack += ", ";
            }
        }
    } else {
        neccPack = "";
    }

    // create string of recommended other packages
    if(d.Dependencies.SuggestedOtherPackages != [] && typeof(d.Dependencies.SuggestedOtherPackages) != "undefined"){
        const nRecPack = d.Dependencies.SuggestedOtherPackages.length;
        var recPack = "";
        for(let i=0; i < nRecPack; i++ ){
            recPack += d.Dependencies.SuggestedOtherPackages[i][0];
            recPack += ' (';
            recPack += d.Dependencies.SuggestedOtherPackages[i][1];
            recPack += ')'
            if(i==nRecPack-2 && nRecPack>=1){
                recPack += " and ";
            } else if(i!=nRecPack-1){
                recPack += ", ";
            }
        }
    } else {
        recPack = "";
    }

// combine everything into a single string
    var resString = "";

    // add person list
    resString += "By: " ;
    resString += namesPersons;
    resString += "<br>";

    // package website
    resString += 'Package Website: <a href=\"' ;
    resString += d.PackageWWWHome ;
    resString += '\" target=\"_blank\">' ;
    resString += d.PackageWWWHome;
    resString += '</a><br>';

    // issue tracker
    resString += 'Issue Tracker: <a href=\"' ;
    resString += d.IssueTrackerURL ;
    resString += '\" target=\"_blank\">' ;
    resString += d.IssueTrackerURL ;
    resString += '</a>';
    resString += '<br>';

    // manuals in html and pdf format
    resString += 'Manuals: ' ;
    resString += '<a href=\"https://docs.gap-system.org/pkg/';
    resString += d.PackageName.toLowerCase() ;
    resString += '/';
    resString += d.PackageDoc[0].HTMLStart ;
    resString += '\" target=\"_blank\">[HTML]</a> ';
    resString += '<a href=\"https://docs.gap-system.org/pkg/';
    resString += d.PackageName.toLowerCase() ;
    resString += '/' ;
    resString += d.PackageDoc[0].PDFFile;
    resString += '\" target=\"_blank\">[PDF]</a><br>';

    // abstract
    resString += 'Abstract: <br>';
    if(d.AbstractHTML != ""){
        resString += d.AbstractHTML ;
    } else {
        resString += 'No abstract provided'
    }
    resString += '<br><br>';

    // archives
    resString += 'Archives: <a href=\"' ;
    resString += d.ArchiveURL ;
    resString += '\" target=\"_blank\">' ;
    resString += d.ArchiveURL ;
    resString += '</a><br>';

    // GAP version
    resString += 'GAP Version: ';
    resString += d.Dependencies.GAP;
    resString += '<br>';

    // neccessary packages
    if(neccPack != ""){
        resString += 'Neccessary other Packages: ';
        resString += neccPack;
    } else {
        resString += 'Neccessary other Packages: None';
    }
    resString += '<br>';

    // recommended packages
    if(recPack != ""){
        resString += 'Recommended other Packages: ';
        resString += recPack;

    } else {
        resString += 'Recommended other Packages: None';
    }
    resString += '<br>';

    // license
    resString += 'License: ';
    resString += d.License;
    resString += '<br>';

    return resString;
}


// define a table
let table = new DataTable('#packageList', {
  // get the json file
    "ajax" : {
        "url": "latest.json",
        "dataSrc": function(dictData){
          // as the json file is a dict for every package it is necessary it put all values into an array for Datatables to understand it
            var arr = [];
            for(var key in dictData){
                arr.push(dictData[key]);
            }
            return arr;
        }
    },
  // define the columns shown in the table
    columns : [
        {
            class: 'dt-control',
            orderable: false,
            data: null,
            defaultContent: ''
        },
        { "data" : "PackageName"},
        { "data" : "Version", width: '7em'},
        { "data" : "Date"},
    // the following row is set to invisible and only there so the search picks up the additional text as well
        { data: null, render: (data, type, row) => format(data), visible: false},
        { "data" : "Subtitle"},
    ],
  // change the text for the search function to make it distinct to the page search function
    language: {
        search: 'Search table:'
    },
// set default number of packages shown
    pageLength: 25
});

DataTable.datetime('DD/MM/YYYY');


// Add event listener for opening and closing details
table.on('click', 'td.dt-control', function (e) {
    let tr = e.target.closest('tr');
    let row = table.row(tr);

    if (row.child.isShown()) {
        // This row is already open - close it
        row.child.hide();
    }
    else {
        // Open this row
        row.child(format(row.data())).show();
    }
});