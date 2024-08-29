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

    // combine everything into a single string
    var resString = "";

    // abstract
    if(d.AbstractHTML != ""){
        resString += d.AbstractHTML;
    }

    // the remaining data is grouped in a description list
    resString += `<dl id="packages">`;

    resString += `<dt>Links</dt>`;
    resString += `<dd>`;

    // package website
    resString += `[<a href="${d.PackageWWWHome}" target="_blank">Homepage</a>] `;

    if (d.IssueTrackerURL != "") {
        resString += `[<a href="${d.IssueTrackerURL}" target="_blank">Issue Tracker</a>] `;
    }

    if (d.SourceRepository !== undefined) {
        resString += `[<a href="${d.SourceRepository.URL}" target="_blank">Source code repository</a>] `;
    }
    resString += `</dd>`;


    // add person list
    resString += `<dt>By</dt>`;
    resString += `<dd>${namesPersons}</dd>`;

    // manuals in html and pdf format
    resString += `<dt>Documentation</dt>`;
    resString += `<dd>`;
    const docsurl = "https://docs.gap-system.org/pkg/";
    const pkgname = d.PackageName.toLowerCase();
    for (var i = 0; i < d.PackageDoc.length; i++) {
        var book = d.PackageDoc[i];
        resString += book.BookName + " ";
        resString += `<a href="${docsurl}${pkgname}/${book.HTMLStart}" target="_blank">[HTML]</a> `;
        resString += `<a href="${docsurl}${pkgname}/${book.PDFFile}" target="_blank">[PDF]</a> `;
        resString += '<br>';
    }
    resString += `</dd>`;

    // archives
    resString += `<dt>Download</dt>`;
    resString += `<dd>`;
    var formats = d.ArchiveFormats.split(" ");
    for (var i = 0; i < formats.length; i++) {
        resString += `[<a href="${d.ArchiveURL}${formats[i]}">${formats[i]}</a>] `;
    }
    resString += `</dd>`;

    // license
    resString += `<dt>License</dt>`;
    resString += `<dd>${d.License}</dd>`;

    resString += `</dl>`;

    return resString;
}

// should sort date column, does not work
DataTable.render.datetime('YYYY-MM-DD');

// define a table
let table = new DataTable('#packageList', {
    // get the json file
    "ajax" : {
        "url": "../assets/package-infos.json",
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
        { "data" : "Date",
           render: function (data, type, row) {
                       // convert dates in format YYYY-MM-DD to DD/MM/YYYY
                       if (isNaN(data) && moment(data, 'DD/MM/YYYY', true).isValid()) {
                           return moment(data, 'DD/MM/YYYY').format('YYYY-MM-DD');
                       }
                       return moment(data, 'YYYY-MM-DD').format('YYYY-MM-DD');
                   }
        },
        // the following column is set to invisible and only there so the search picks up the additional text as well
        { data: null, render: (data, type, row) => format(data), visible: false},
        { "data" : "Subtitle"},
    ],
    // change the text for the search function to make it distinct to the page search function
    language: {
        search: 'Search table:'
    },
    // set default number of packages shown
    pageLength: 25,
});

const urlParams = new URLSearchParams(window.location.search);
if (urlParams.has('q')) {
    table.search(urlParams.get('q'));
}

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
